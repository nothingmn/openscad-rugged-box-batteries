docker build -t magic-box .
docker run --rm -v $(pwd)profiles/18650.1x1.scad:/Profiles/18650.1x1.scad -v $(pwd)/render:/render magic-box:latest