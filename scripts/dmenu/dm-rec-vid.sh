
ffmpeg -f x11grab -s 1920x1080 -framerate 30 -i :0.0 \
       -f pulse -i default \
       -c:v libx264 -preset veryfast -crf 23 \
       -c:a aac -b:a 192k \
       output.mp4
