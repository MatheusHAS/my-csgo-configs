@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
SET CFG_FOLDER_PATH=csgo/cfg
SET CSGO_PATH="%programfiles(x86)%/Steam/steamapps/common/Counter-Strike Global Offensive"

cls

echo "-----------"
echo "Detecting CSGO Path"
if not exist "%CSGO_PATH%" (
    echo "Path not found."
    set /P CSGO_PATH=Enter CSGO PATH: 
)

if not exist "%CSGO_PATH%" (
    echo "Folder %CSGO_PATH% dont exists..."
    exit
)

echo "Path found: %CSGO_PATH%"
echo "--------"
echo "Copying files..."

cd configs
for %%i in (competitive.cfg training.cfg crosshair.cfg) do (
    if exist "%CSGO_PATH%/%CFG_FOLDER_PATH%/%%i" (
        echo "File %%i already exist"
    ) else (
        echo "Copying %%i ..."
        copy %%i "%CSGO_PATH%/%CFG_FOLDER_PATH%/%%i"
    )
)

echo "--------"
echo "Finished..."
pause