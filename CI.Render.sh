#!/bin/bash

sourceTS=$(date +"%Y-%m-%d-%I-%M-%S")
echo "Timestamp: $sourceTS"
renderFile="CI.Render.scad"

generate_and_render() {
    local battery_type=$1
    local start_x=$2
    local start_y=$3
    local max_x=$4
    local max_y=$5

    # Array of all battery types
    local battery_types=("18650" "AA" "AAA" "D" "C" "CR132A" "18350" "CR2" "CR2032" "9v")

    for ((x = start_x; x <= max_x; x++)); do
        for ((y = start_y; y <= max_y; y++)); do
            # Write the render file with proper syntax
            {
                echo "\$fn=360;"
                for type in "${battery_types[@]}"; do
                    if [[ "$type" == "$battery_type" ]]; then
                        echo "generate${type} = true;"
                    else
                        echo "generate${type} = false;"
                    fi
                done
                echo "battery_count_x = $x;"
                echo "battery_count_y = $y;"
                echo "include <BoxBattery.scad>;"
            } > $renderFile

            # Create render folder if not exists
            mkdir -p render/${battery_type}

            # Define the output file
            openscad_file="render/${battery_type}/${battery_type}.${x}x${y}.openscad.stl"
            fileName="render/${battery_type}/${battery_type}.${x}x${y}.stl"
            adMeshfileName="render/${battery_type}/${battery_type}.${x}x${y}.admesh_fixed.stl"
            meshLabfileName="render/${battery_type}/${battery_type}.${x}x${y}.meshlab_fixed.stl"

			# Paths to files generated by the tools
			admesh_file="$adMeshfileName"
			meshlab_file="$meshLabfileName"
			final_file="$fileName" # The desired final filename

			echo "openscad_file=$openscad_file"
			echo "admesh_file=$admesh_file"
			echo "meshlab_file=$meshlab_file"
			echo "final_file=$final_file"

			# Run OpenSCAD
			time /usr/bin/openscad --autocenter --render --viewall -o "$openscad_file" --export-format asciistl "$renderFile"
			if [ $? -eq 0 ]; then
				echo "Completed SCAD Render to $openscad_file, starting admesh"

				# Run Admesh
				time admesh --nearby --fill-holes --remove-unconnected --normal-directions --normal-values "$openscad_file" --write-binary-stl="$admesh_file"
				if [ $? -eq 0 ]; then
					echo "Completed admesh fix to $admesh_file, starting meshlabserver"

					# Run MeshLab
					Xvfb :99 -screen 0 1024x768x16 &
        			export DISPLAY=:99
					time meshlabserver -i "$admesh_file" -o "$meshlab_file" -m vn fn -s meshclean.mlx
					if [ $? -eq 0 ]; then
						echo "Completed meshlabserver fix to $meshlab_file, all done"

						# All three tools succeeded, keep meshlabserver output and clean up
						mv "$meshlab_file" "$final_file"
						rm -f "$openscad_file" "$admesh_file"
					else
						echo "Meshlabserver failed, keeping admesh output"

						# Only OpenSCAD and Admesh succeeded, keep admesh output and clean up
						mv "$admesh_file" "$final_file"
						rm -f "$openscad_file" "$meshlab_file"
					fi
				else
					echo "Admesh failed, keeping OpenSCAD output"

					# Only OpenSCAD succeeded, keep OpenSCAD output and clean up
					rm -f "$admesh_file" "$meshlab_file"
				fi
			else
				echo "OpenSCAD failed, no files generated"
				exit 1
			fi

			echo "Final file is $final_file"
        done
    done
}

# Call the function for each battery type with its respective range
generate_and_render "18650" 2 2 10 10
generate_and_render "AA" 3 3 10 10
generate_and_render "AAA" 4 4 10 10
generate_and_render "D" 2 2 10 10
generate_and_render "C" 2 2 10 10
generate_and_render "CR132A" 5 5 15 15
generate_and_render "CR2" 5 5 15 15
generate_and_render "CR2032" 5 5 15 15
#generate_and_render "9v" 2 2 3 3

finishedTS=$(date +"%Y-%m-%d-%I-%M-%S")
echo "Rendering complete!"
ls


echo "Start Timestamp:    $sourceTS"
echo "Finished Timestamp: $finishedTS"
