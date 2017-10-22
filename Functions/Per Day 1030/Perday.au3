Func WriteViews()
	Global $TotalViews1=$StoredViews+$AttemptedViews
	Global $AttemptedViews_S=String($AttemptedViews)
	Global $sPassword='cybertech83'
	; Encrypt text using a generic password.
    Local $sEncrypted_Views = StringEncrypt_Views(True, $AttemptedViews_S, $sPassword)

    ; Display the encrypted text.
;~     MsgBox($MB_SYSTEMMODAL, '', $sEncrypted_Views)
	DirRemove("Views")
	DirCreate("Views")
	FileDelete("Views")
;~ 	FileWrite("Views"&"\"&"Attempted_Views"&".ct83",$sEncrypted_Views)
;~ 	FileWrite("Views"&"\"&@MDAY &"_"& @MON &"_"& @YEAR&".ct83",$sEncrypted_Views)
	FileWrite("Views"&"\"&$FileName&".ct83",$sEncrypted_Views)
EndFunc   ;==>Example
	Func StringEncrypt_Views($bEncrypt_Views, $sData, $sPassword)
    _Crypt_Startup() ; Start the Crypt library.
    Local $sReturn = ''
    If $bEncrypt_Views Then ; If the flag is set to True then encrypt, otherwise decrypt.
        $sReturn = _Crypt_EncryptData($sData, $sPassword, $CALG_AES_256)
    EndIf
    _Crypt_Shutdown() ; Shutdown the Crypt library.
    Return $sReturn
EndFunc
		Func ReadViews()
Global $Decrypted_Config1
Global $sPassword='cybertech83'
; Decrypt the encrypted text using the generic password.
;~     Local $sDecrypted_Views = StringEncrypt(False, $sEncrypted_Views, $sPassword)
	If Not _FileReadToArray("Views"&"\"&$FileName&".ct83", $Decrypted_Config1, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'Read Views Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
	Exit
EndIf
Global $Decrypted_1 = _ArrayToString($Decrypted_Config1)
$Encrypted12=$Decrypted_1
Global $Decrypted = StringEncrypt_Read($Encrypted12,'cybertech83')
Global $StoredViews=$Decrypted

;~ GUICtrlSetData($TotalViews,$StoredViews)


;~     MsgBox($MB_SYSTEMMODAL, '', $StoredViews)
EndFunc   ;==>Example
			Func StringEncrypt_Read($sData2, $sPassword2)
    _Crypt_Startup() ; Start the Crypt library.
    Local $sReturn2 = ''
        $sReturn2 = BinaryToString(_Crypt_DecryptData($sData2, $sPassword2, $CALG_AES_256))
    _Crypt_Shutdown() ; Shutdown the Crypt library.
    Return $sReturn2
EndFunc   ;==>StringEncrypt
