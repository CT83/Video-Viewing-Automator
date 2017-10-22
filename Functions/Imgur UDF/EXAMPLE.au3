#include 'Imgur.au3'

;~ Global $fp = "Capture.PNG" ;location of the image file
Global $fp = "Images.bmp"

If Not @error Then
	Local $image_url = _imgur_upload($fp)

	If @error Then
		MsgBox(16 + 262144, 'Error', 'Upload image failed!')
	Else
		; Open with default browser
		ConsoleWrite($image_url)
		ShellExecute($image_url)
	EndIf
EndIf