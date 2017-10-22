#include <Crypt.au3>
#include <MsgBoxConstants.au3>
#include <File.au3>


Global $sPassword='cybertech83'
Global $Decrypted_Config1
ReadViews()

Func ReadViews()
Global $Decrypted_Config1
Global $sPassword='cybertech83'
; Decrypt the encrypted text using the generic password.
;~     Local $sDecrypted_Views = StringEncrypt(False, $sEncrypted_Views, $sPassword)
	If Not _FileReadToArray("Views"&"\"&"Attempted_Views"&".ct83", $Decrypted_Config1, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'CustomerID Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
	Exit
EndIf
Global $Decrypted_1 = _ArrayToString($Decrypted_Config1)
$Encrypted12=$Decrypted_1
Global $Decrypted = StringEncrypt_Read($Encrypted12,'cybertech83')
Global $StoredViews=$Decrypted
    MsgBox($MB_SYSTEMMODAL, '', $StoredViews)
EndFunc   ;==>Example

Func StringEncrypt_Read($sData2, $sPassword2)
    _Crypt_Startup() ; Start the Crypt library.
    Local $sReturn2 = ''
        $sReturn2 = BinaryToString(_Crypt_DecryptData($sData2, $sPassword2, $CALG_AES_256))
    _Crypt_Shutdown() ; Shutdown the Crypt library.
    Return $sReturn2
EndFunc   ;==>StringEncrypt