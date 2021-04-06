@echo off

setlocal

REM 設定ファイルパス
set CONFFILE=.\docker_setting.ini

REM 設定ファイルが存在するか確認する
if not exist %CONFFILE% (
    echo ERROR: Not found %CONFFILE%
    exit /b 1
)

REM 設定ファイルを読み込む
for /f "usebackq tokens=1,* delims==" %%a in ("%CONFFILE%") do (
    set %%a=%%b
)


REM メインのコンテナ実行
docker build -t %IMAGE% .
docker run --rm --gpus all -d -v %CD%:%VOL_CURR_TGT% -v %VOL_DATA_SRC%:%VOL_DATA_TGT% --name %CONTAINER% -p %PORT% %IMAGE%

REM tensorboard用のコンテナ実行
docker run --rm -d -v %CD%:%VOL_CURR_TGT% -p 6006:6006 --name tensorboard -it tensorflow/tensorflow bash

endlocal
