#include <File.au3>
#include <array.au3>

$output_file = @ScriptDir & "\Output.csv"
DeleteFile($output_file)
Local $results_array[2][3]

;~ $results_array[0][0] = "Name"
$results_array[0][1] = "Team"
_ArrayDisplay($results_array)
$rows = UBound($results_array) - 1
$columns = UBound($results_array, 2) -1
For $i = 0 To $rows
    $sLine = ""
    For $j = 0 To $columns
        $sLine &= $results_array[$i][$j] & ","
    Next
    FileWriteLine($output_file, StringTrimRight($sLine, 1))
Next
ShellExecute($output_file)


Func DeleteFile($file)

    $file_usage = FileOpen($file, 1)

    If $file_usage = -1 Then
        MsgBox(0, @ScriptName, $file & " is in use." & @CRLF & _'Please close it before continuing.')
        Exit
    EndIf

    FileClose($file_usage)

    If FileExists($file) Then
        FileDelete($file)
    EndIf

EndFunc   ;==>DeleteFile