docker run --rm --hostname devhost --name map_server --device=/dev/dri:/dev/dri -e DISPLAY=$DISPLAY --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -d map_server:latest
