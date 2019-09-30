#!/bin/sh

PARENT_DIR=$1
PWD=$(pwd)
cd "$PARENT_DIR"
FILE_LIST=$(find  -type f -exec file -N -i -- {} + | sed -n 's!: video/[^:]*$!!p')
echo "$FILE_LIST" 
echo "Do you want to convert these files?"
read y
if [ $y == 'y' ]
then
    while read -r FILE_LIST
    do
        echo "$FILE_LIST"

        ffmpeg   -loglevel 2 -i "$FILE_LIST" -c:v libx265 -preset ultrafast -x265-params lossless=0 "${FILE_LIST%.*}".hevc.mkv < /dev/null
        echo "complete"
    done <<< "$FILE_LIST"
fi

cd "$PWD"