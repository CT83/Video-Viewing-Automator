#include <Crypt.au3>
#include <Crypt.au3>
#include <MsgBoxConstants.au3>


Global $sPassword='cybertech83'
Example()

Func Example()
    ; Encrypt text using a generic password.
    Local $sEncrypted_Views = StringEncrypt(True, 'Encrypt this data.', $sPassword)

    ; Display the encrypted text.
    MsgBox($MB_SYSTEMMODAL, '', $sEncrypted_Views)

    ; Decrypt the encrypted text using the generic password.
    Local $sDecrypted_Views = StringEncrypt(False, $sEncrypted_Views, $sPassword)

    ; Display the decrypted text.
    MsgBox($MB_SYSTEMMODAL, '', $sDecrypted_Views)
EndFunc   ;==>Example

Func StringEncrypt($bEncrypt_Views, $sData, $sPassword)
    _Crypt_Startup() ; Start the Crypt library.
    Local $sReturn = ''
    If $bEncrypt_Views Then ; If the flag is set to True then encrypt, otherwise decrypt.
        $sReturn = _Crypt_EncryptData($sData, $sPassword, $CALG_AES_256)
    Else
        $sReturn = BinaryToString(_Crypt_DecryptData($sData, $sPassword, $CALG_AES_256))
    EndIf
    _Crypt_Shutdown() ; Shutdown the Crypt library.
    Return $sReturn
EndFunc   ;==>StringEncrypt