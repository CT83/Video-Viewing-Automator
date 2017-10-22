#RequireAdmin
#include <Crypt.au3>
#include <date.au3>
#include <MsgBoxConstants.au3>
#include <APIDiagConstants.au3>
#include <WinAPIDiag.au3>
Global $CustomerID=InputBox("Enter the Customer ID", "Enter the Customer ID to Generate Key for ", "", "",- 1, -1)
;~ Global $EncryptionPassword = InputBox("Enter the Password", "Enter the Encryption Password ", "", "",- 1, -1)
Global $EncryptionPassword = 'cybertech83'
Global $Expiry_Date2 = InputBox("Enter Desired Expiry Date", "Enter the Desired Expiry Date to generate a key for ", "YYYY/MM/DD", "",- 1, -1)
;~ Global $EncryptionPassword="cybertech83"
Global $hardware1 = InputBox("Enter Desired Hardware ID", "Enter the Hardware ID to generate a key for ", "", "",- 1, -1)
;~ Global $hardware1 = _WinAPI_UniqueHardwareID($UHID_All) & @CRLF
Global $EncryptData=$hardware1&"@#"&$Expiry_Date2
MsgBox($MB_SYSTEMMODAL, 'Data to be Encrypte is -', $EncryptData)
Global $Encrypted = StringEncrypt($EncryptData, $EncryptionPassword)
MsgBox($MB_SYSTEMMODAL, 'Generated Key is -', $Encrypted)
DirRemove($CustomerID)
DirCreate($CustomerID)
FileDelete($CustomerID)
FileWrite($CustomerID&"\"&$CustomerID&".ct83",$Encrypted)
Func StringEncrypt($sData, $sPassword)
    _Crypt_Startup() ; Start the Crypt library.
    Local $sReturn = ''
        $sReturn = _Crypt_EncryptData($sData, $sPassword, $CALG_AES_256)
        _Crypt_Shutdown() ; Shutdown the Crypt library.
    Return $sReturn
EndFunc   ;==>StringEncrypt

