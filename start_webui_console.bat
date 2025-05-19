@echo off
echo KoeMoji WebUIを起動しています...

:: 通常モードで起動（コンソールウィンドウが表示されます）
start cmd /k "python webui.py"

:: サーバーが起動するまで少し待機
timeout /t 3 /nobreak > nul

:: デフォルトブラウザでWebUIを開く
start http://localhost:8080

echo WebUIが起動しました。ブラウザで http://localhost:8080 が開かれます。
echo コンソールウィンドウを閉じるとWebUIも終了します。
