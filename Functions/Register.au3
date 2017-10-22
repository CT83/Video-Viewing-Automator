
#include <Crypt.au3>
#include <MsgBoxConstants.au3>

Global $AttemptedViews=
$AttemptedViews=$AttemptedViews+1
WriteViews()

Func WriteViews()
	Global $AttemptedViews_S=String($AttemptedViews)
	Global $sPassword='cybertech83'
	; Encrypt text using a generic password.
    Local $sEncrypted_Views = StringEncrypt(True, $AttemptedViews_S, $sPassword)

    ; Display the encrypted text.
    MsgBox($MB_SYSTEMMODAL, '', $sEncrypted_Views)


;~ 	DirRemove("Views")
;~ 	DirCreate("Views")
;~ 	FileDelete("Views")
	FileWrite("Views\"&$Filename,$sEncrypted_Views)

EndFunc   ;==>Example



Func StringEncrypt($bEncrypt_Views, $sData, $sPassword)
    _Crypt_Startup() ; Start the Crypt library.
    Local $sReturn = ''
    If $bEncrypt_Views Then ; If the flag is set to True then encrypt, otherwise decrypt.
        $sReturn = _Crypt_EncryptData($sData, $sPassword, $CALG_AES_256)
    EndIf
    _Crypt_Shutdown() ; Shutdown the Crypt library.
    Return $sReturn
EndFunc   ;==>StringEncrypt