# mojito

`mojito` is a command line utility for converting/encodingvideo files to HEVC 265 format. `mojito`is a wrapper around powerful `FFmpeg` library and supports conversion of files in bulk. Learn more about `FFmpeg` [here](https://www.ffmpeg.org/)

### USE
`sh main.sh </path/to/parent/directoty>`

`mojito` takes path of parent directory and encode all video files of that directory in HEVC 265 format.



### TODOS
 - [ ] Add help command
 - [ ] Add loader for bulk operation.
 - [x] Suppress FFmpeg output
 - [x] Add option to remove source files
 - [x] Add recursive traversal of parent directory and covert those files.
