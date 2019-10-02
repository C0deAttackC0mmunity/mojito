# mojito

`mojito` is a command line utility for converting/encoding video files to HEVC 265 format.

`mojito` is a wrapper around powerful `FFmpeg` library and supports conversion of files in bulk.

Learn more about `FFmpeg` [here](https://www.ffmpeg.org/).


### USE
```
sh main.sh [-r] -p </path/to/parent/directoty>
```

`mojito` takes path of parent directory and encodes all video files of that directory in HEVC 265 format.

#### Options
`-r` deletes source files after conversion.


### TODOS
 - [ ] Add option to specify container of converted files.
 - [ ] Add loader for bulk operation.
 - [x] Suppress FFmpeg output.
 - [x] Add option to remove source files.
 - [x] Add recursive traversal of parent directory and covert those files.
 - [x] Add help command.
