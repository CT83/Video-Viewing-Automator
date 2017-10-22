Func GUI_VarAll()
;Setting Scheme1

Global $GS1_TarToday=GUICtrlRead($S1_TarToday)
Global $GS1_TarHours=GUICtrlRead($S1_TarHours)
If _IsChecked($S1_TarChk) Then
Global $GS1_TarChk=True
Else
Global $GS1_TarChk=False
EndIf

Global $GS1_HusLim=GUICtrlRead($S1_HusLim)
Global $GS1_HusBef=GUICtrlRead($S1_HusBef)
If _IsChecked($S1_HusChk) Then
Global $GS1_HusChk=True
Else
Global $GS1_HusChk=False
EndIf

;randomization
Global $GS1_RandTar=GUICtrlRead($S1_RandTar)
Global $GS1_RandHus=GUICtrlRead($S1_RandHus)
If _IsChecked($S1_RandChk) Then
Global $GS1_RandChk=True
Else
Global $GS1_RandChk=False
EndIf


If _IsChecked($S1_Chk) Then
Global $GS1_Chk=True
Else
Global $GS1_Chk=False
EndIf


;Setting Scheme 2
Global $GS2_TarToday=GUICtrlRead($S2_TarToday)
Global $GS2_TarHours=GUICtrlRead($S2_TarHours)
If _IsChecked($S2_TarChk) Then
Global $GS2_TarChk=True
Else
Global $GS2_TarChk=False
EndIf

Global $GS2_HusLim=GUICtrlRead($S2_HusLim)
Global $GS2_HusBef=GUICtrlRead($S2_HusBef)
If _IsChecked($S2_HusChk) Then
Global $GS2_HusChk=True
Else
Global $GS2_HusChk=False
EndIf

Global $GS2_RandTar=GUICtrlRead($S2_RandTar)
Global $GS2_RandHus=GUICtrlRead($S2_RandHus)
If _IsChecked($S2_RandChk) Then
Global $GS2_RandChk=True
Else
Global $GS2_RandChk=False
EndIf


If _IsChecked($S2_Chk) Then
Global $GS2_Chk=True
Else
Global $GS2_Chk=False
EndIf

;Setting Scheme 3
Global $GS3_TarToday=GUICtrlRead($S3_TarToday)
Global $GS3_TarHours=GUICtrlRead($S3_TarHours)
If _IsChecked($S3_TarChk) Then
Global $GS3_TarChk=True
Else
Global $GS3_TarChk=False
EndIf

Global $GS3_HusLim=GUICtrlRead($S3_HusLim)
Global $GS3_HusBef=GUICtrlRead($S3_HusBef)
If _IsChecked($S3_HusChk) Then
Global $GS3_HusChk=True
Else
Global $GS3_HusChk=False
EndIf

Global $GS3_RandTar=GUICtrlRead($S3_RandTar)
Global $GS3_RandHus=GUICtrlRead($S3_RandHus)
If _IsChecked($S3_RandChk) Then
Global $GS3_RandChk=True
Else
Global $GS3_RandChk=False
EndIf


If _IsChecked($S3_Chk) Then
Global $GS3_Chk=True
Else
Global $GS3_Chk=False
EndIf


;Push Bullet Updates
Global $GPsh_AftCyc=GUICtrlRead($Psh_AftCyc)
Global $GPsh_Tk1=String(GUICtrlRead($Psh_Tk1))
Global $GPsh_Tk2=String(GUICtrlRead($Psh_Tk2))
Global $GPsh_Tk3=String(GUICtrlRead($Psh_Tk3))
Global $GPsh_Tk4=String(GUICtrlRead($Psh_Tk4))
If _IsChecked($Psh_Chk) Then
Global $GPsh_Chk=True
Else
Global $GPsh_Chk=False
EndIf


;Misc
If _IsChecked($autostartcheck) Then
Global $Gautostartcheck=True
Else
Global $Gautostartcheck=False
EndIf
Global $GCIAP=GUICtrlRead($CIAP)
Global $GNickName_Edit=GUICtrlRead($NickName_Edit)
Global $GZ_Lim=GUICtrlRead($Z_Lim)
Global $GL_Lim=GUICtrlRead($L_Lim)

;LogIn
Global $GLoginID=GUICtrlRead($LoginID)
Global $GPassword=GUICtrlRead($Password)

;Screenshots
If _IsChecked($ScrSht_FChk) Then
Global $GScrSht_FChk=True
Else
Global $GScrSht_FChk=False
EndIf

If _IsChecked($ScrSht_SChk) Then
Global $GScrSht_SChk=True
Else
Global $GScrSht_SChk=False
EndIf


;Coordinate Offsets
Global $GCoord_x=GUICtrlRead($Coord_x)
Global $GCoord_y=GUICtrlRead($Coord_y)

EndFunc



Func _IsChecked($idControlID)
	Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc