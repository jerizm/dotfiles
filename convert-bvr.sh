docker run --rm -it --device=/dev/dri -v `pwd`:/workdir akashisn/ffmpeg:6.0 -y \
    -probesize 42M -framerate 30 -i Frontdoor\ 2023-10-31\ 04.00.00\ PM.bvr \
    -vcodec copy -an -bsf:v h264_mp4toannexb \
    video-h264_qsv.mp4

