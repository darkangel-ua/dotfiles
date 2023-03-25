#!/usr/bin/bash

google-chrome-stable \
    --enable-features=VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,Vulkan \
    --enable-zero-copy \
    --ignore-gpu-blocklist \
    --enable-gpu-rasterization \
    --enable-oop-rasterization \
    --canvas-oop-rasterization \
    --enable-raw-draw \
    --enable-drdc \
    --enable-smooth-scrolling \
    --enable-vulkan \
    "$@"
