docker build -t magic-box .
#one off rendering example
#docker run --rm -v $(pwd)/profiles/18650.1x1.scad:/incoming/18650.1x1.scad -v $(pwd)/render:/render magic-box:latest /incoming/18650.1x1.scad

#render all 18650 profiles
#docker run --rm  -v $(pwd)/render:/render magic-box:latest 18650

#render all AA  profiles
#docker run --rm  -v $(pwd)/render:/render magic-box:latest AA

#render a single scad file
#docker run --rm -v $(pwd)/profiles/18650.2x1.scad:/incoming/18650.2x1.scad -v $(pwd)/render:/render robchartier/magic-box:latest /incoming/18650.2x1.scad

#render all 3006 profiles
docker run --rm -v $(pwd)/profiles:/profiles  -v $(pwd)/render:/app/render magic-box:latest 3006