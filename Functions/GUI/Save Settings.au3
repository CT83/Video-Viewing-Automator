;path where default configurations are stored
Global $cSavedPath="Configurations\Default"


Func Call_SaveAll()
EndFunc
Dir_Save("Target1", "GS1_TarToday", "12")
Func btnSave_All()
	#cs
;read current gui values into variables before writing them to save in a file
GUI_VarAll()

Dir_Save("Target1", "GS1_TarToday", $GS1_TarToday)
Dir_Save("Target1", "GS1_TarHours", $GS1_TarHours)
Dir_Save("Target1", "GS1_TarChk", $GS1_TarChk)
Dir_Save("Hustle1", "GS1_HusLim", $GS1_HusLim)
Dir_Save("Hustle1", "GS1_HusBef", $GS1_HusBef)
Dir_Save("Hustle1", "GS1_HusChk", $GS1_HusChk)
Dir_Save("Randomization1", "GS1_RandTar", $GS1_RandTar)
Dir_Save("Randomization1", "$GS1_RandHus", $GS1_RandHus)
Dir_Save("Randomization1", "GS1_RandChk", $GS1_RandChk)
Dir_Save("Scheme1", "GS1_Chk", $GS1_Chk)

Dir_Save("Target2", "GS2_TarToday", $GS2_TarToday)
Dir_Save("Target2", "GS2_TarHours", $GS2_TarHours)
Dir_Save("Target2", "GS2_TarChk", $GS2_TarChk)
Dir_Save("Hustle2", "GS2_HusLim", $GS2_HusLim)
Dir_Save("Hustle2", "GS2_HusBef", $GS2_HusBef)
Dir_Save("Hustle2", "GS2_HusChk", $GS2_HusChk)
Dir_Save("Randomization2", "GS2_RandTar", $GS2_RandTar)
Dir_Save("Randomization2", "GS2_RandHus", $GS2_RandHus)
Dir_Save("Randomization2", "GS2_RandChk", $GS2_RandChk)
Dir_Save("Scheme2", "GS2_Chk", $GS2_Chk)

Dir_Save("Target3", "GS3_TarToday", $GS3_TarToday)
Dir_Save("Target3", "GS3_TarHours", $GS3_TarHours)
Dir_Save("Target3", "GS3_TarChk", $GS3_TarChk)
Dir_Save("Hustle3", "GS3_HusLim", $GS3_HusLim)
Dir_Save("Hustle3", "GS3_HusBef", $GS3_HusBef)
Dir_Save("Hustle3", "GS3_HusChk", $GS3_HusChk)
Dir_Save("Randomization3", "GS3_RandTar", $GS3_RandTar)
Dir_Save("Randomization3", "GS3_RandHus", $GS3_RandHus)
Dir_Save("Randomization3", "GS3_RandChk", $GS3_RandChk)
Dir_Save("Scheme3", "GS3_Chk", $GS3_Chk)


Dir_Save("Pushbullet", "GPsh_AftCyc", $GPsh_AftCyc)
Dir_Save("Pushbullet", "GPsh_Tk1", $GPsh_Tk1)
Dir_Save("Pushbullet", "GPsh_Tk1", $GPsh_Tk2)
Dir_Save("Pushbullet", "GPsh_Tk1", $GPsh_Tk3)
Dir_Save("Pushbullet", "GPsh_Tk1", $GPsh_Tk4)
Dir_Save("Pushbullet", "GPsh_Chk", $GPsh_Chk)

Dir_Save("Misc", "Gautostartcheck", $Gautostartcheck)
Dir_Save("Misc", "GCIAP", $GCIAP)
Dir_Save("Misc", "GNickName_Edit", $GNickName_Edit)
Dir_Save("Misc", "GZ_Lim", $GZ_Lim)
Dir_Save("Misc", "GL_Lim", $GL_Lim)

Dir_Save("LogIn", "GLoginID", $GLoginID)
Dir_Save("LogIn", "GPassword", $GPassword)

Dir_Save("Screenshot", "GScrSht_FChk", $GScrSht_FChk)
Dir_Save("Screenshot", "GScrSht_SChk", $GScrSht_SChk)

Dir_Save("Coordinates", "GCoord_x", $GCoord_x)
Dir_Save("Coordinates", "GCoord_y", $GCoord_y)

ToolTip2("Saving All Data!")
#ce
	EndFunc

Func Dir_Save($cS_Group,$cS_Name,$cData,$cSavedPath="Configurations\Default")
Local $cCurrent_Path=String($cSavedPath&"\"&$cS_Group&"\"&$cS_Name&".ct83")
Local $cData1=String($cData)
If FileExists($cCurrent_Path) Then
	FileDelete($cCurrent_Path)
EndIf
;~ ToolTip2("Saving '   "&$cData&"   'in : "&$cCurrent_Path)
FileWrite($cCurrent_Path,$cData1)
Endfunc
