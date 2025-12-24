# Start from the official ROS Noetic base image
FROM ros:noetic-ros-base

ENV http_proxy="http://172.17.0.1:10808"
ENV https_proxy="http://172.17.0.1:10808"
ARG DEBIAN_FRONTEND=noninteractive

# Set the working directory inside the container
WORKDIR /app

# Install the ros-noetic-map-server package and its dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-map-server \
    && rm -rf /var/lib/apt/lists/*

# The base image already has a ROS entrypoint script, so you can leave CMD empty
# or specify a default command, such as launching a map_server instance if you have a map file.
# For example, if you copy a map file (map.yaml and map.pgm) into the container:
# COPY map.* /app/
# CMD ["roslaunch", "map_server", "map_server.launch", "map_file:=/app/map.yaml"]

# If you just want a base image with map_server installed, no CMD is needed here.
