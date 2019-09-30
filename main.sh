#!/bin/sh


PWD=$(pwd)
DELETE="false"

#Check for flags
while getopts :p:r aflag
do
    case $aflag in
        r) DELETE="true";;
        p) PARENT_DIR=$OPTARG;;
        ?) echo "Illegal flag : $aflag, terminating";exit -1;;
    esac
done

cd "$PARENT_DIR"

FILE_LIST=$(find  -type f -exec file -N -i -- {} + | sed -n 's!: video/[^:]*$!!p')
DEL_LIST=$FILE_LIST
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

echo $FILE_LIST
#block to remove converted files
if [ $DELETE == 'true' ]
then
    while read -r DEL_LIST
    do
        echo "$DEL_LIST"

        rm "$DEL_LIST" 
        echo "Successfully removed $DEL_LIST"
    done <<< "$DEL_LIST"
fi

cd "$PWD"