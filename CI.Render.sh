#!/bin/bash
tag=$(date +"%Y-%m-%d-%I-%M")
release_name="CIRelease-$tag"

render_scad_file() {
    local scad_file=$1
    local output_dir=$2
    local x=$3
    local y=$4
    local battery_type=$5

    if [[ $x -eq 0 && $y -eq 0 ]]; then
        # Define file paths without x and y in the filename
        openscad_file="${output_dir}/${battery_type}.openscad.stl"
        admesh_file="${output_dir}/${battery_type}.admesh_fixed.stl"
        final_file="${output_dir}/${battery_type}.stl"
    else
        # Define file paths with x and y in the filename
        openscad_file="${output_dir}/${battery_type}.${x}x${y}.openscad.stl"
        admesh_file="${output_dir}/${battery_type}.${x}x${y}.admesh_fixed.stl"
        final_file="${output_dir}/${battery_type}.${x}x${y}.stl"
    fi

    echo "Rendering SCAD file: $scad_file"
    echo "Output Directory: $output_dir"
    echo "OpenSCAD Output: $openscad_file"
    echo "Admesh Output: $admesh_file"
    echo "Final File: $final_file"

    # Run OpenSCAD
    time /usr/bin/openscad --autocenter --render --viewall -o "$openscad_file" --export-format asciistl "$scad_file"
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
}

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
            output_dir="render/${battery_type}"
            mkdir -p "$output_dir"

            # Render the SCAD file with x and y in filename
            render_scad_file "$renderFile" "$output_dir" "$x" "$y" "$battery_type"
        done
    done
}

render_all_profiles() {
    local profiles_dir="profiles"
    local output_dir="render/profiles"

    # Check if profiles directory exists
    if [ ! -d "$profiles_dir" ]; then
        echo "Profiles directory '$profiles_dir' does not exist."
        exit 1
    fi

    # Find all .scad files in the profiles directory
    mkdir -p "$output_dir"
    for scad_file in "$profiles_dir"/*.scad; do
        # Skip if no files found
        if [ ! -e "$scad_file" ]; then
            echo "No .scad files found in '$profiles_dir'."
            break
        fi

        # Get the base name of the file without the extension
        base_name=$(basename "$scad_file" .scad)

        echo "Processing profile: $scad_file"
        echo "Base name: $base_name"

        # Render SCAD file with default x and y values
        render_scad_file "$scad_file" "$output_dir" 0 0 "$base_name"
    done

}

main() {
    local battery_type=$1
    echo "Timestamp: $tag"
    renderFile="CI.Render.scad"

    # Check for specific battery type or default to rendering all profiles
    if [[ -z "$battery_type" ]]; then
        echo "No battery type specified. Rendering all profiles."
        render_all_profiles
    else
        case "$battery_type" in
            "18650")
                generate_and_render "18650" 2 2 5 5
                ;;
            "AA")
                generate_and_render "AA" 2 2 10 10
                ;;
            "AAA")
                generate_and_render "AAA" 2 2 10 10
                ;;
            "D")
                generate_and_render "D" 2 2 5 5
                ;;
            "C")
                generate_and_render "C" 2 2 5 5
                ;;
            "CR132A")
                generate_and_render "CR132A" 5 5 10 10
                ;;
            "CR2")
                generate_and_render "CR2" 5 5 10 10
                ;;
            "CR2032")
                generate_and_render "CR2032" 5 5 10 10
                ;;
            "9v")
                generate_and_render "9v" 2 2 5 5
                ;;
            *)
                echo "Unknown battery type: $battery_type"
                echo "Valid options are: 18650, AA, AAA, D, C, CR132A, CR2, CR2032, 9v"
                exit 1
                ;;
        esac
    fi

    finishedTS=$(date +"%Y-%m-%d-%I-%M-%S")
    echo "Rendering complete!"
    ls

    echo "Start Timestamp:    $tag"
    echo "Finished Timestamp: $finishedTS"
}

main "$@"
