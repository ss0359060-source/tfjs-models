@echo off
setlocal

set "REPO_ROOT=%~dp0..\.."
set "POSE_ROOT=%REPO_ROOT%\pose-detection"
set "DEMO_ROOT=%POSE_ROOT%\demos\live_video"

echo [1/5] Checking shared directory junctions...
cd /d "%POSE_ROOT%" || exit /b 1

if not exist "%POSE_ROOT%\src\shared\calculators" (
  if exist "%POSE_ROOT%\src\shared" del /f /q "%POSE_ROOT%\src\shared" >nul 2>nul
  if exist "%POSE_ROOT%\src\shared" rmdir /s /q "%POSE_ROOT%\src\shared" >nul 2>nul
  mklink /J "%POSE_ROOT%\src\shared" "%REPO_ROOT%\shared" || exit /b 1
)

if not exist "%POSE_ROOT%\test_data\shared" (
  if exist "%POSE_ROOT%\test_data\shared" del /f /q "%POSE_ROOT%\test_data\shared" >nul 2>nul
  if exist "%POSE_ROOT%\test_data\shared" rmdir /s /q "%POSE_ROOT%\test_data\shared" >nul 2>nul
  mklink /J "%POSE_ROOT%\test_data\shared" "%REPO_ROOT%\shared\test_data" || exit /b 1
)

echo [2/5] Checking npx...
where npx >nul 2>nul
if errorlevel 1 (
  echo npx was not found. Please install Node.js first.
  exit /b 1
)

echo [3/5] Building pose-detection with Node 16 and Yarn 1...
cd /d "%DEMO_ROOT%" || exit /b 1
call npx -y -p node@16 -p yarn@1.22.22 yarn build-dep || exit /b 1

echo [4/5] Installing live_video demo dependencies...
call npx -y -p node@16 -p yarn@1.22.22 yarn install || exit /b 1

echo [5/5] Starting MoveNet demo...
echo Open this URL in your browser:
echo http://127.0.0.1:1234/?model=movenet
echo.
call npx -y -p node@16 node .\node_modules\parcel-bundler\bin\cli.js index.html --no-hmr -p 1234 --host 127.0.0.1

endlocal
