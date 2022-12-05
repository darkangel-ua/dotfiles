#!/usr/bin/bash

# have to disable Vulkan otherwise gaming become disaster
google-chrome-stable --enable-features=VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization \
                     --disable-features=Vulkan \
                     --enable-zero-copy \
                     --use-gl=desktop \
                     --ignore-gpu-blocklist \
                     --enable-gpu-rasterization \
                     --enable-oop-rasterization \
                     --canvas-oop-rasterization \
                     --enable-raw-draw \
                     --enable-drdc \
                     --enable-smooth-scrolling \
                     "$@"
