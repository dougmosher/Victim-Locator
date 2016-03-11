#FFmpeg takes both input streams and maps them side by side onto a blank canvas

/home/root/bin/ffmpeg/ffmpeg -s 1280x720 -f video4linux2 -input_format mjpeg -i /dev/video0 -s 1280x720 -f video4linux2 -input_format mjpeg -i /dev/video1 -filter_complex "nullsrc=size=2650x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" -f mpeg1video \
http://127.0.0.1:8082