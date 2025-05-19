
' KoeMojiAuto非表示起動スクリプト
Set objShell = CreateObject("WScript.Shell")
strPath = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
objShell.CurrentDirectory = strPath

' バックグラウンドでWebUIを起動
On Error Resume Next
Set objExec = objShell.Exec("python webui.py")

' エラーチェック
If Err.Number <> 0 Then
    WScript.Echo "Pythonの実行に失敗しました。" & vbCrLf & _
                "・Pythonがインストールされているか" & vbCrLf & _
                "・環境変数PATHにPythonが追加されているか" & vbCrLf & _
                "確認してください。"
    WScript.Quit
End If

' サーバー起動待機（少し長めに）
WScript.Sleep 4000
objShell.Run "http://localhost:8080"
