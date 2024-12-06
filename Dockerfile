# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Copy all local files to the image
COPY . .

# Update the package list and install required packages
RUN apt-get update && \
    apt-get install -y openscad admesh && \
    rm -rf /var/lib/apt/lists/*

# Make the shell script executable
RUN chmod +x CI.Render.sh

# Expose the "render" folder for output
VOLUME /render

# Set the entrypoint to execute the script
ENTRYPOINT ["./CI.Render.sh"]
