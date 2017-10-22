#RequireAdmin
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#Include <GuiEdit.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>

Global $LoginID_Config,$Password_Config
_FileReadToArray("Credentials\LoginID_Config.txt", $LoginID_Config, 0)
 _FileReadToArray("Credentials\Password_Config.txt", $Password_Config, 0)
Global $LoginID1 = _ArrayToString($LoginID_Config)
Global $Password1 = _ArrayToString($Password_Config)
#Region ### START Koda GUI section ### Form=c:\users\rohan\desktop\local data\autoit\programs\30second\30second\test\form\form1.kxf
$MainMenu = GUICreate("Video Viewing Automator", 390, 522, -1, -1)
GUISetIcon("", -1)
$Start = GUICtrlCreateButton("Start ", 16, 432, 233, 41, $BS_PUSHLIKE)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xA0A0A0)
GUICtrlSetCursor (-1, 0)
$Name = GUICtrlCreateLabel("Video Viewing Automator", 24, 0, 326, 31)
GUICtrlSetFont(-1, 18, 800, 0, "Courier New")
GUICtrlSetColor(-1, 0x000000)
$Credits = GUICtrlCreateLabel("__A Program by Rohan Sawant ", 0, 488, 184, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
$Contact = GUICtrlCreateLabel("Email- rohansawantct83@gmail.com", 0, 504, 207, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
$Option = GUICtrlCreateTab(8, 40, 377, 369, $WS_BORDER, BitOR($TCS_EX_FLATSEPARATORS,$WS_EX_STATICEDGE))
GUICtrlSetFont(-1, 10, 800, 0, "Default")
$TabSheet1 = GUICtrlCreateTabItem("Log")
$Log = GUICtrlCreateEdit("", 8, 66, 361, 329)
GUICtrlSetData(-1, "")
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlSetCursor (-1, 0)
$Options = GUICtrlCreateTabItem("Options")
GUICtrlSetState(-1,$GUI_SHOW)
$Group1 = GUICtrlCreateGroup("LogIn", 12, 67, 361, 129, BitOR($GUI_SS_DEFAULT_GROUP,$BS_LEFT,$BS_FLAT))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$LoginID = GUICtrlCreateInput("", 100, 91, 265, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Password = GUICtrlCreateInput("", 100, 131, 265, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$SaveCredentials = GUICtrlCreateButton("Save", 212, 163, 137, 25, BitOR($BS_PUSHLIKE,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$LogID = GUICtrlCreateLabel("LogInID", 24, 96, 49, 17)
$Pass = GUICtrlCreateLabel("Password", 24, 136, 58, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetCursor (-1, 0)
$Group2 = GUICtrlCreateGroup("Email Updates", 12, 203, 361, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_LEFT,$BS_FLAT))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$EmailID = GUICtrlCreateInput("", 100, 227, 265, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$SaveEmail = GUICtrlCreateButton("SaveEmail", 212, 259, 137, 25, BitOR($BS_PUSHLIKE,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Label6 = GUICtrlCreateLabel("EmailID", 24, 232, 47, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetCursor (-1, 0)
$TabSheet2 = GUICtrlCreateTabItem("Stats")
$Group4 = GUICtrlCreateGroup("Errors", 13, 229, 361, 121)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$pauses = GUICtrlCreateLabel("Video Auto Pause Errors", 21, 253, 174, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateEdit("", 304, 248, 57, 25, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetCursor (-1, 2)
$Label2 = GUICtrlCreateLabel("Clear LogIn Errors", 24, 280, 129, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateEdit("", 304, 280, 57, 25, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetCursor (-1, 2)
$Label3 = GUICtrlCreateLabel("Restarts", 24, 312, 62, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateEdit("", 304, 312, 57, 25, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group5 = GUICtrlCreateGroup("Other", 13, 349, 361, 49)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label4 = GUICtrlCreateLabel("Days Before License to Expire", 23, 362, 213, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateEdit("", 310, 363, 57, 25, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("Basic Statistics", 14, 70, 361, 153)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Starttime = GUICtrlCreateLabel("Start Time", 22, 102, 75, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateEdit("", 182, 126, 73, 25, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetCursor (-1, 2)
$S_Views = GUICtrlCreateLabel("Successful Views", 22, 134, 124, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label1 = GUICtrlCreateLabel("Attempted Views", 22, 158, 119, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateEdit("", 182, 150, 73, 25, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetCursor (-1, 2)
GUICtrlCreateEdit("", 182, 94, 177, 25, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetCursor (-1, 2)
$Label5 = GUICtrlCreateLabel("Emails Sent", 26, 187, 86, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateEdit("", 183, 183, 73, 25, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
GUICtrlSetCursor (-1, 0)
$Stop = GUICtrlCreateButton("Stop", 264, 432, 113, 41)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xA0A0A0)
GUICtrlSetCursor (-1, 0)
Dim $MainMenu_AccelTable[1][2] = [["{INS}", $Start]]
GUISetAccelerators($MainMenu_AccelTable)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###



While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Start
			StartUp()
		Case $Stop

		Case $SaveCredentials
			SaveCredentials()

		Case $SaveEmail
			SaveEmail()


	EndSwitch
WEnd




Func SaveCredentials()

Global $LoginID_Config,$Password_Config
;remove above declarations

FileDelete("Credentials/LoginID_Config.txt")
FileDelete("Credentials/Password_Config.txt")
Sleep(500)
$LoginID1=GUICtrlRead($LoginID)
$Password1=GUICtrlRead($Password)
DirCreate("Credentials")
FileWrite("Credentials\LoginID_Config.txt",$LoginID1)
FileWrite("Credentials\Password_Config.txt",$Password1)
;commands to add to the text file after encryption1
If Not _FileReadToArray("Credentials\LoginID_Config.txt", $LoginID_Config, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'LoginID Configuration File'! Please Try again! ")
EndIf
Global $LoginID1 = _ArrayToString($LoginID_Config)

If Not _FileReadToArray("Credentials\Password_Config.txt", $Password_Config, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'Password Configuration File'! Please Try again! ")
EndIf
Global $Password1 = _ArrayToString($Password_Config)
MsgBox($MB_SYSTEMMODAL,"Login Credentials Successfully Saved!","LoginID  :  "&$LoginID1&"	Password  :  "&$Password1)
EndFunc


Func StartUp()
;do something
$Log_Var = "Add this to the editcontrol" & @CRLF
_GUICtrlEdit_AppendText($Log,$Log_Var)
EndFunc