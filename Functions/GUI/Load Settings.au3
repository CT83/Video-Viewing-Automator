;path where default configurations are stored
Global $cSavedPath="Configurations\Default"


Func Load_All()
;read current gui values into variables before writing them to save in a file

Dir_Load("Target1", "GS1_TarToday", $GS1_TarToday)
Dir_Load("Target1", "GS1_TarHours", $GS1_TarHours)
Dir_Load("Target1", "GS1_TarChk", $GS1_TarChk)
Dir_Load("Hustle1", "GS1_HusLim", $GS1_HusLim)
Dir_Load("Hustle1", "GS1_HusBef", $GS1_HusBef)
Dir_Load("Hustle1", "GS1_HusChk", $GS1_HusChk)
Dir_Load("Randomization1", "GS1_RandTar", $GS1_RandTar)
Dir_Load("Randomization1", "$GS1_RandHus", $GS1_RandHus)
Dir_Load("Randomization1", "GS1_RandChk", $GS1_RandChk)
Dir_Load("Scheme1", "GS1_Chk", $GS1_Chk)

Dir_Load("Target2", "GS2_TarToday", $GS2_TarToday)
Dir_Load("Target2", "GS2_TarHours", $GS2_TarHours)
Dir_Load("Target2", "GS2_TarChk", $GS2_TarChk)
Dir_Load("Hustle2", "GS2_HusLim", $GS2_HusLim)
Dir_Load("Hustle2", "GS2_HusBef", $GS2_HusBef)
Dir_Load("Hustle2", "GS2_HusChk", $GS2_HusChk)
Dir_Load("Randomization2", "GS2_RandTar", $GS2_RandTar)
Dir_Load("Randomization2", "GS2_RandHus", $GS2_RandHus)
Dir_Load("Randomization2", "GS2_RandChk", $GS2_RandChk)
Dir_Load("Scheme2", "GS2_Chk", $GS2_Chk)

Dir_Load("Target3", "GS3_TarToday", $GS3_TarToday)
Dir_Load("Target3", "GS3_TarHours", $GS3_TarHours)
Dir_Load("Target3", "GS3_TarChk", $GS3_TarChk)
Dir_Load("Hustle3", "GS3_HusLim", $GS3_HusLim)
Dir_Load("Hustle3", "GS3_HusBef", $GS3_HusBef)
Dir_Load("Hustle3", "GS3_HusChk", $GS3_HusChk)
Dir_Load("Randomization3", "GS3_RandTar", $GS3_RandTar)
Dir_Load("Randomization3", "GS3_RandHus", $GS3_RandHus)
Dir_Load("Randomization3", "GS3_RandChk", $GS3_RandChk)
Dir_Load("Scheme3", "GS3_Chk", $GS3_Chk)


Dir_Load("Pushbullet", "GPsh_AftCyc", $GPsh_AftCyc)
Dir_Load("Pushbullet", "GPsh_Tk1", $GPsh_Tk1)
Dir_Load("Pushbullet", "GPsh_Tk1", $GPsh_Tk2)
Dir_Load("Pushbullet", "GPsh_Tk1", $GPsh_Tk3)
Dir_Load("Pushbullet", "GPsh_Tk1", $GPsh_Tk4)
Dir_Load("Pushbullet", "GPsh_Chk", $GPsh_Chk)

Dir_Load("Misc", "Gautostartcheck", $Gautostartcheck)
Dir_Load("Misc", "GCIAP", $GCIAP)
Dir_Load("Misc", "GNickName_Edit", $GNickName_Edit)
Dir_Load("Misc", "GZ_Lim", $GZ_Lim)
Dir_Load("Misc", "GL_Lim", $GL_Lim)

Dir_Load("LogIn", "GLoginID", $GLoginID)
Dir_Load("LogIn", "GPassword", $GPassword)

Dir_Load("Screenshot", "GScrSht_FChk", $GScrSht_FChk)
Dir_Load("Screenshot", "GScrSht_SChk", $GScrSht_SChk)

Dir_Load("Coordinates", "GCoord_x", $GCoord_x)
Dir_Load("Coordinates", "GCoord_y", $GCoord_y)


;load which checkboxes are checked and which are not
CheckIfTrue($autostartcheck,$Gautostartcheck)
;Setting Scheme 1
CheckIfTrue($S1_TarChk,$GS1_TarChk)
CheckIfTrue($S1_HusChk,$GS1_HusChk)
CheckIfTrue($S1_RandChk,$GS1_RandChk)
CheckIfTrue($S1_Chk,$GS1_Chk)

;Setting Scheme 2
CheckIfTrue($S2_TarChk,$GS2_TarChk)
CheckIfTrue($S2_HusChk,$GS2_HusChk)
CheckIfTrue($S2_RandChk,$GS2_RandChk)
CheckIfTrue($S2_Chk,$GS2_Chk)

;Setting Scheme 3
CheckIfTrue($S3_TarChk,$GS3_TarChk)
CheckIfTrue($S3_HusChk,$GS3_HusChk)
CheckIfTrue($S3_RandChk,$GS3_RandChk)
CheckIfTrue($S3_Chk,$GS3_Chk)

;Push Bullet Updates
CheckIfTrue($Psh_Chk,$GPsh_Chk)

;Screenshots
CheckIfTrue($ScrSht_FChk,$GScrSht_FChk)
CheckIfTrue($ScrSht_SChk,$GScrSht_SChk)


ToolTip2("Saving All Data!")
EndFunc

Func Dir_Load($cS_Group,$cS_Name,$cVData,$cSavedPath="Configurations\Default")
Local $cCurrent_Path=String($cSavedPath&"\"$cS_Group&"\"&$cS_Name&".ct83")
If Not _FileReadToArray($cCurrent_Path,$cFileData, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the "& $cS_Group&"\"&$cS_Name &".ct83 File ! Please Try again! ")
EndIf
Local $cFileData = _ArrayToString($cFileData)
ToolTip2("Loading  :'   "&$cFileData&"   'from : "&$cCurrent_Path)
GUICtrlSetData($cVData,$cFileData)
Endfunc

Func CheckIfTrue($ChckBoxVar,$ChckBoxData)
ToolTip2("Checking if "&$ChckBoxVar&" is checked...")
If $ChckBoxData=True Then
	GUICtrlSetState($ChckBoxVar, $GUI_CHECKED)
	ToolTip2(&$ChckBoxVar&" is Checked.")
Else
	ToolTip2(&$ChckBoxVar&" is UnChecked.")
EndIf
EndFunc

