@echo off
echo KoeMojiAutoをバックグラウンドで起動しています...

:: デスクトップパスを取得
set DESKTOP=%USERPROFILE%\Desktop

:: VBScriptでの起動
wscript.exe "%~dp0start_hidden.vbs"

echo.
echo デスクトップにショートカットを作成しますか？ (Y/N)
set /p CREATE_SHORTCUT=

if /i "%CREATE_SHORTCUT%"=="Y" (
    echo デスクトップショートカットを作成しています...
    
    :: VBScriptでショートカットを作成
    echo Set objWS = CreateObject("WScript.Shell") > "%TEMP%\create_shortcut.vbs"
    echo Set objLink = objWS.CreateShortcut("%DESKTOP%\KoeMojiAuto.lnk") >> "%TEMP%\create_shortcut.vbs"
    echo objLink.TargetPath = "wscript.exe" >> "%TEMP%\create_shortcut.vbs"
    echo objLink.Arguments = """%~dp0start_hidden.vbs""" >> "%TEMP%\create_shortcut.vbs"
    echo objLink.WorkingDirectory = "%~dp0" >> "%TEMP%\create_shortcut.vbs"
    echo objLink.Description = "KoeMojiAuto WebUI (ターミナル非表示)" >> "%TEMP%\create_shortcut.vbs"
    echo objLink.IconLocation = "%~dp0static\icon.png, 0" >> "%TEMP%\create_shortcut.vbs"
    echo objLink.Save >> "%TEMP%\create_shortcut.vbs"
    
    wscript.exe "%TEMP%\create_shortcut.vbs"
    del "%TEMP%\create_shortcut.vbs"
    
    echo ショートカットをデスクトップに作成しました。
) else (
    echo ショートカットは作成されませんでした。
)

echo.
echo WebUIが起動しました。ブラウザが開かれない場合は、
echo 手動でブラウザを開いて http://localhost:8080 にアクセスしてください。
