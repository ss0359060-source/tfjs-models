# Demos

Try our demos and get inspired with what you can do with pose-detection models!

## Table of Contents
1.  [Live Camera Demo](#live-camera-demo)

2. [Upload a Video Demo](#upload-a-video-demo)

3. [How to Run a Demo](#how-to-run-a-demo)

-------------------------------------------------------------------------------

## Live Camera Demo
This demo uses your camera to get live stream and tracks your poses in real-time.
You can try out different models, runtimes and backends to see the difference. It
works on laptops, iPhones and android phones.

[MoveNet model entry](https://storage.googleapis.com/tfjs-models/demos/pose-detection/index.html?model=movenet)

[BlazePose model entry](https://storage.googleapis.com/tfjs-models/demos/pose-detection/index.html?model=blazepose)

[PoseNet model entry](https://storage.googleapis.com/tfjs-models/demos/pose-detection/index.html?model=posenet)


## Upload a Video Demo
This demo allows you to upload a video (in .mp4 format) to run with the model.
Once the video is processed, it automatically downloads the video with pose keypoints.

[MoveNet model entry](https://storage.googleapis.com/tfjs-models/demos/pose-detection-upload-video/index.html?model=movenet)

[BlazePose model entry](https://storage.googleapis.com/tfjs-models/demos/pose-detection-upload-video/index.html?model=blazepose)

[PoseNet model entry](https://storage.googleapis.com/tfjs-models/demos/pose-detection-upload-video/index.html?model=posenet)


## How to Run a Demo
If you want to run any of the demos locally, follow these steps:

1. Go to the demo folder, e.g. `cd live_video`

2. Remove cache etc. `rm -rf .cache dist node_modules`

3. Build dependency. `yarn build-dep`

4. Install dependencies. `yarn`

5. Run the demo. `yarn watch`

6. The demo runs at `localhost:1234`. (Remember to provide URL model parameter e. g. `localhost:1234/?model=movenet`)

### Windows local setup notes

On Windows, this repository may check out `pose-detection/src/shared` and
`pose-detection/test_data/shared` as plain text files instead of links. If
`yarn build-dep` fails with errors such as `Cannot find module '../shared/...`,
replace those files with junctions from the `pose-detection` directory:

```powershell
cd D:\HAOJING_code\stu-project\tfjs-models\pose-detection

Remove-Item .\src\shared -Force
New-Item -ItemType Junction -Path .\src\shared -Target ..\shared

Remove-Item .\test_data\shared -Force
New-Item -ItemType Junction -Path .\test_data\shared -Target ..\shared\test_data
```

This demo uses older Parcel 1 dependencies. If your system Node.js is newer
(for example Node 18, 20, or 24) and dependency install or startup fails around
`deasync`, run the demo with Node 16 without changing the system Node install:

```powershell
cd D:\HAOJING_code\stu-project\tfjs-models\pose-detection\demos\live_video

npx -y -p node@16 -p yarn@1.22.22 yarn build-dep
npx -y -p node@16 -p yarn@1.22.22 yarn install
npx -y -p node@16 node .\node_modules\parcel-bundler\bin\cli.js index.html --no-hmr -p 1234 --host 127.0.0.1
```

Then open the MoveNet demo at:

```text
http://127.0.0.1:1234/?model=movenet
```

Use `127.0.0.1` instead of `localhost` if the browser reports
`ERR_CONNECTION_REFUSED` while the server is running.

You can also run the same Windows setup and MoveNet demo startup with:

```powershell
cd D:\HAOJING_code\stu-project\tfjs-models\pose-detection\demos
.\run_movenet_local.bat
```
