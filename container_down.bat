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

REM メインのコンテナ終了
docker stop %CONTAINER%

REM tensorboard用のコンテナ実行
docker stop tensorboard

endlocal
