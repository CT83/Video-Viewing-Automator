Func CheckVideoViewerLoaded()

	Local $CheckVideoViewerLoaded=0
	While $CheckVideoViewerLoaded=0
	CheckDowntime()
	WinActivate("Click")

	;If Pixelget color test
	Local $hP_ColorReq=0xD6C900						;Required Coords
	Local $hP_ColorTest = PixelGetColor(326, 89)	;Coordinate of Orange Video Viewer Region
	If( $hP_ColorTest = $hP_ColorReq ) Then
		ToolTip("VideoViewer Loaded! ",0,0)
		ToolTip2("VideoViewer Loaded!")
		$videoviewer = ""
		CheckYouTubeLoaded()
		$CheckVideoViewerLoaded=1
		$CheckViewer_Counter=0
	Else
		$CheckVideoViewerLoaded=0
		ToolTip("VideoViewer Not Loaded! Retrying in 3 seconds",0,0)
		ToolTip2("VideoViewer Not Loaded! Retrying in 3 seconds")
		sleep(3000)
		$VideoViewer_LoadErr=$VideoViewer_LoadErr=1
		$CheckViewer_Counter=$CheckViewer_Counter+1

		If $CheckViewer_Counter=3 Then
		ClosePopUp()
		ClickView()
		EndIf

		If $CheckViewer_Counter=15 Then
		$CheckViewer_Counter=0
		Restart()
		EndIf
	EndIf
	WEnd
EndFunc


