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
        openscad_file="${output_dir}/${battery_type}.openscad.3mf"
    else
        # Define file paths with x and y in the filename
        openscad_file="${output_dir}/${battery_type}.${x}x${y}.openscad.3mf"
    fi
    echo "starting to render via openscad to 3mf"
    # Run OpenSCAD
    # https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_OpenSCAD_in_a_command_line_environment
    time /usr/bin/openscad --autocenter --render --viewall -o "$openscad_file" "$scad_file"

    echo "Final file is $scad_file"
}


# Array of all battery types
local battery_types=("18650" "AA" "AAA" "D" "C" "CR132A" "18350" "CR2" "CR2032" "9v" "22lr" "7mm" "12G3" "12G234" "16G234" "20G3" "20G234" "28G234" "65Creedmor" "223" "243" "270" "300" "300WinMag" "308" "3006" "3030" "4103" "410212")

generate_and_render() {
    local battery_type=$1
    local start_x=$2
    local start_y=$3
    local max_x=$4
    local max_y=$5

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
                echo "numberOfHinges = generate22lr || generateAAA ? 1 : battery_count_x >= 9 ? 4 : battery_count_x > 7 ? 3 : battery_count_x >= 3 ? 2 : 1;"
                echo "numberOfLatches = generate22lr || generateAAA ? 1 : battery_count_x >= 9 ? 4 : battery_count_x > 7 ? 3 : battery_count_x >= 3 ? 2 : 1;"
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
            "22lr")
                generate_and_render "22lr" 5 5 10 10
                ;;
            "7mm")
                generate_and_render "7mm" 4 4 10 10
                ;;
            "12G3")
                generate_and_render "12G3" 4 4 10 10
                ;;
            "12G234")
                generate_and_render "12G234" 4 4 10 10
                ;;
            "16G234")
                generate_and_render "16G234" 4 4 10 10
                ;;
            "20G3")
                generate_and_render "20G3" 4 4 10 10
                ;;
            "20G234")
                generate_and_render "20G234" 4 4 10 10
                ;;
            "28G234")
                generate_and_render "28G234" 4 4 10 10
                ;;
            "65Creedmor")
                generate_and_render "65Creedmor" 4 4 10 10
                ;;
            "223")
                generate_and_render "223" 4 4 10 10
                ;;
            "243")
                generate_and_render "243" 4 4 10 10
                ;;
            "270")
                generate_and_render "270" 4 4 10 10
                ;;
            "300")
                generate_and_render "300" 4 4 10 10
                ;;
            "300WinMag")
                generate_and_render "300WinMag" 4 4 10 10
                ;;
            "308")
                generate_and_render "308" 4 4 10 10
                ;;
            "3006")
                generate_and_render "3006" 4 4 10 10
                ;;
            "3030")
                generate_and_render "3030" 4 4 10 10
                ;;
            "4103")
                generate_and_render "4103" 4 4 10 10
                ;;
            "410212")
                generate_and_render "410212" 4 4 10 10
                ;;
            *)
                if [ -f "$battery_type" ]; then
                    echo "Processing file: $battery_type"
                    base_name=$(basename "$battery_type" .scad)
                    file_name=$(basename "$battery_type")
                    mkdir -p render/
                    mkdir ./in/
                    cp $battery_type ./in/
                    cd ./in/
                    render_scad_file "$file_name" "../render" 0 0 "$base_name"                                        
                    cd ../render
                    cp * /render
                else
                    echo "Unknown battery type: $battery_type"
                    echo "Valid options are:"
                    output=""
                    for type in "${battery_types[@]}"; do
                        output+="$type "
                    done
                    echo "${output% }"               
                    exit 1
                fi
                ;;
        esac


        
    fi

    finishedTS=$(date +"%Y-%m-%d-%I-%M-%S")
    echo "Rendering complete!"
    echo "Start Timestamp:    $tag"
    echo "Finished Timestamp: $finishedTS"
}

main "$@"
