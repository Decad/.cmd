'
' Source http://superuser.com/questions/110991/can-you-zip-a-file-from-the-command-prompt-using-only-windows-built-in-capabili
'
'
'Get command-line arguments.

Set fso = CreateObject("Scripting.FileSystemObject")
InputFolder = fso.GetAbsolutePathName(WScript.Arguments.Item(0))
ZipFile = fso.GetAbsolutePathName(WScript.Arguments.Item(1))

'Create empty ZIP file.
CreateObject("Scripting.FileSystemObject").CreateTextFile(ZipFile, True).Write "PK" & Chr(5) & Chr(6) & String(18, vbNullChar)

Set objShell = CreateObject("Shell.Application")
Set source = objShell.NameSpace(InputFolder).Items
Set zfo = objShell.NameSpace( ZipFile )

zfo.CopyHere(source)

'Keep script waiting until compression is done
Do Until zfo.Items.Count = _
    objShell.NameSpace(InputFolder).Items.Count
    WScript.Sleep 200
Loop