
## Building

podman build .
podman tag <image> musescore:4.2.0

## Running 

podman run -e XDG_RUNTIME_DIR -v $XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR -it -v /dev/dri:/dev/dri -v /tmp:/tmp --security-opt label=disable -e DISPLAY -v $PWD:$PWD -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/snd --group-add keep-groups musescore:4.2.0

