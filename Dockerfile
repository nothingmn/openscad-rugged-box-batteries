FROM openscad/openscad:dev.2024-12-09

# Copy all local files to the image
COPY . /app


# Set the working directory inside the container
WORKDIR /app

# Set up the /render volume
VOLUME /app/render

# Copy the CI.Render.sh script into the container (optional, if you have the script locally)
# ADD or COPY would be used to place the script into the image, e.g.,
# COPY CI.Render.sh /path/to/CI.Render.sh

# Define the entry point to execute CI.Render.sh
ENTRYPOINT ["/app/CI.Render.sh"]
