#include <Crypt.au3>
#include <APIDiagConstants.au3>
#include <WinAPIDiag.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <ScreenCapture.au3>
#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>
#include <WinAPISys.au3>
#include <Array.au3>
#include <File.au3>
#include <Array.au3>
#include <ScreenCapture.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#Include <GuiEdit.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <Inet.au3>
#include <GUiIPAddress.au3>
#include <InetConstants.au3>
#include <WinAPIFiles.au3>
#include <Misc.au3>
#include <Date.au3>

Global $Decrypted_Config1
Global $sPassword='cybertech83'
; Decrypt the encrypted text using the generic password.
;~     Local $sDecrypted_Views = StringEncrypt(False, $sEncrypted_Views, $sPassword)
	If Not _FileReadToArray("Views\28052016.ct83", $Decrypted_Config1, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'Read Views Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
	Exit
	EndIf
;~ ToolTip2("Reading from File 28052016.ct83")
Global $Decrypted_1 = _ArrayToString($Decrypted_Config1)
;~ $Encrypted12=$Decrypted_1
Global $Decrypted = StringEncrypt_Read($Decrypted_1,$sPassword)
MsgBox("","",$Decrypted)
;~ ToolTip2("View  :"& $Decrypted)
;~ GUICtrlSetData($TotalViews,$StoredViews)


Func StringEncrypt_Read($sData2, $sPassword2)
    _Crypt_Startup() ; Start the Crypt library.
    Local $sReturn2 = ''
        $sReturn2 = BinaryToString(_Crypt_DecryptData($sData2, $sPassword2, $CALG_AES_256))
    _Crypt_Shutdown() ; Shutdown the Crypt library.
    Return $sReturn2
EndFunc