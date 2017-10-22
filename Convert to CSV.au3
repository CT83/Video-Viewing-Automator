#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>
#include <Crypt.au3>

Global $Files_Dir= String(@ScriptDir&"\Views_Details")
Global $FileName_Var
Example()

Func Example()
    ; List all the files and folders in the desktop directory using the default parameters and return the full path.
    Local $aFileList = _FileListToArray($Files_Dir, Default, Default, True)
    If @error = 1 Then
        MsgBox($MB_SYSTEMMODAL, "", "Path was invalid.")
        Exit
    EndIf
    If @error = 4 Then
        MsgBox($MB_SYSTEMMODAL, "", "No file(s) were found.")
        Exit
    EndIf
    ; Display the results returned by _FileListToArray.
    _ArrayDisplay($aFileList)
	Global $NumberFiles = UBound($aFileList, $UBOUND_ROWS)
	MsgBox("","",$NumberFiles)

	Global $aFileList_ArrCounter=1
	Do
;~ 	$FileName_Var=_ArrayToString($aFileList,$aFileList_ArrCounter)
	$FileName_Var=$aFileList[$aFileList_ArrCounter]
	$FileName_Var=String($FileName_Var)
;~ 	ToolTip($FileName_Var)
	ReadViews()
;~ 	Sleep(2000)
;~ 	MsgBox(0,"","",$FileName_Var)
	$aFileList_ArrCounter=$aFileList_ArrCounter+1
	Until $aFileList_ArrCounter=$NumberFiles
ShellExecute('Views_Detials_Store\Details.csv')

EndFunc   ;==>Example





Global $sPassword='cybertech83'
Global $Decrypted_Config1
;~ ReadViews()

Func ReadViews()
Global $Decrypted_Config1
Global $sPassword='cybertech83'
; Decrypt the encrypted text using the generic password.
;~     Local $sDecrypted_Views = StringEncrypt(False, $sEncrypted_Views, $sPassword)
	If Not _FileReadToArray($Filename_Var, $Decrypted_Config1, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'CustomerID Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
	Exit
EndIf
Global $Decrypted_1 = _ArrayToString($Decrypted_Config1)
$Encrypted12=$Decrypted_1
Global $Decrypted = StringEncrypt_Read($Encrypted12,'cybertech83')
Global $StoredViews=$Decrypted
;~     MsgBox($MB_SYSTEMMODAL, '', $StoredViews)
DirCreate("Views_Details_Store")
FileWrite("Views_Details_Store\Details.csv",$StoredViews&@CRLF)
EndFunc   ;==>Example

Func StringEncrypt_Read($sData2, $sPassword2)
    _Crypt_Startup() ; Start the Crypt library.
    Local $sReturn2 = ''
        $sReturn2 = BinaryToString(_Crypt_DecryptData($sData2, $sPassword2, $CALG_RC4))
    _Crypt_Shutdown() ; Shutdown the Crypt library.
    Return $sReturn2
EndFunc   ;==>StringEncrypt
