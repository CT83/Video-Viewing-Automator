CheckDeletedVideo()
Global $Private_V_Ctr
Func CheckDeletedVideo()
	Local $hP_ColorReq=0xFFFFFF, $hP_ColorTest = PixelGetColor(660, 534)		;Color and Coordinate of Gray Deleted Video Region
	Local $hP_ColorReq_2=0xCCCCCC, $hP_ColorTest_2 = PixelGetColor(700, 432)	;Color and Coordinate of Gray Deleted Video Region 2
	If( $hP_ColorTest = $hP_ColorReq Or $hP_ColorTest_2 = $hP_ColorReq_2 ) Then
		ToolTip("Deleted / Private Video Detected! ",0,0)
		ToolTip2("Deleted / Private Video Detected!")
		$Private_V_Ctr=$Private_V_Ctr+1
		;GUI error functions
		ClosePopUp()
		ClickView()
		CheckVideoViewerLoaded()
EndFunc

