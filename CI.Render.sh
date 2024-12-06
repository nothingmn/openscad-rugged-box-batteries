#!/bin/bash

tag=$(date +"%Y-%m-%d-%I-%M")
release_name="CIRelease-$tag"
echo "Timestamp: $tag"
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

            # Define file paths
            openscad_file="render/${battery_type}/${battery_type}.${x}x${y}.openscad.stl"
            admesh_file="render/${battery_type}/${battery_type}.${x}x${y}.admesh_fixed.stl"
            final_file="render/${battery_type}/${battery_type}.${x}x${y}.stl"

            echo "openscad_file=$openscad_file"
            echo "admesh_file=$admesh_file"
            echo "final_file=$final_file"

            # Run OpenSCAD
            time /usr/bin/openscad --autocenter --render --viewall -o "$openscad_file" --export-format asciistl "$renderFile"
            if [ $? -eq 0 ]; then
                echo "Completed SCAD Render to $openscad_file, starting admesh"

                # Run Admesh
                time admesh --nearby --fill-holes --remove-unconnected --normal-directions --normal-values "$openscad_file" --write-binary-stl="$admesh_file"
                if [ $? -eq 0 ]; then
                    echo "Completed admesh fix to $admesh_file, all done"

                    # Clean up and rename
                    mv "$admesh_file" "$final_file"
                    rm -f "$openscad_file"
                else
                    echo "Admesh failed, keeping OpenSCAD output"

                    # Keep only the OpenSCAD output
                    mv "$openscad_file" "$final_file"
                    rm -f "$admesh_file"
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
generate_and_render "18650" 2 2 3 3
# generate_and_render "AA" 3 3 4 4
# generate_and_render "AAA" 5 5 6 6
# generate_and_render "D" 2 2 3 3
# generate_and_render "C" 2 2 3 3
# generate_and_render "CR132A" 5 5 6 6
# generate_and_render "CR2" 5 5 6 6
# generate_and_render "CR2032" 5 5 6 6
#generate_and_render "9v" 2 2 3 3

finishedTS=$(date +"%Y-%m-%d-%I-%M-%S")
echo "Rendering complete!"
ls

echo "Start Timestamp:    $tag"
echo "Finished Timestamp: $finishedTS"
