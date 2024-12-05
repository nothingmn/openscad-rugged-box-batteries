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
            fileName="render/${battery_type}/${battery_type}.${x}x${y}.stl"

            echo "Rendering \"$renderFile\" to \"$fileName\""
			echo $(date +"%Y-%m-%d-%I-%M-%S")
            # Render the file
            /usr/bin/openscad --autocenter --viewall -o "$fileName" --export-format asciistl "$renderFile"
			echo $(date +"%Y-%m-%d-%I-%M-%S")
        done
    done
}

# Call the function for each battery type with its respective range
generate_and_render "18650" 2 2 5 5
generate_and_render "AA" 2 2 5 5
generate_and_render "AAA" 2 2 5 5
generate_and_render "D" 2 2 5 5
generate_and_render "C" 2 2 5 5
generate_and_render "CR132A" 5 5 10 10
generate_and_render "CR2" 5 5 10 10
generate_and_render "CR2032" 5 5 10 10
generate_and_render "9v" 2 2 5 5

finishedTS=$(date +"%Y-%m-%d-%I-%M-%S")
echo "Rendering complete!"
ls


echo "Start Timestamp:    $sourceTS"
echo "Finished Timestamp: $finishedTS"
