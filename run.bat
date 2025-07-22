@echo off
setlocal

if "%~1"=="" (
    echo Usage: %~nx0 [DISPLAY]
    echo example: %~nx0 192.168.0.1:0.0
    exit /b 1
)

set "DISPLAY_ARG=%~1"
set "HOME_DIR=%USERPROFILE%"
set "WORKSPACE_DIR=%HOME_DIR%\etri_designkit_workspace"

if not exist "%WORKSPACE_DIR%" (
    echo Creating directory: %WORKSPACE_DIR%
    mkdir "%WORKSPACE_DIR%"
)

docker run -it --rm ^
    -e DISPLAY=%DISPLAY_ARG% ^
    -e TZ=Asia/Seoul ^
    --volume "%WORKSPACE_DIR%:/home/user/etri_designkit_workspace" ^
    jaewonnam/etri_500nm_mpw_designkit:latest
