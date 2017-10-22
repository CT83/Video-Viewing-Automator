;This version has removed functions and features which need the internet to work.
;1


#include <ProgressConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ScreenCapture.au3>
#include <WinAPIDiag.au3>
#include <WinAPISys.au3>
#include <WinAPIFiles.au3>
#include <APIDiagConstants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <ScreenCapture.au3>
#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiEdit.au3>
#include <Inet.au3>
#include <InetConstants.au3>
#include <Misc.au3>
#include <Date.au3>
#include <Crypt.au3>
#include <File.au3>
#include <Array.au3>
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icon\imageedit_2_3070902250.ico
#AutoIt3Wrapper_Res_Fileversion=0.0.0.71
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/tl ,/rm,/pe,/mo,/mi/
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;includes
Local $expdate
Dec_MagicNumber()
;~ Dec_Coordinates()
Dec_All()
If _Singleton("VideoViewingAutomator", 1) = 0 Then
    MsgBox($MB_SYSTEMMODAL, "Warning", "An occurrence of the program is already running. Cannot run two instances of the same program at the same time. Close the previous instance of the program and try again! :) ",120)
    Exit
EndIf
If (Floor(_DateToDayValue(@YEAR, @MON, @MDAY)) > $expdate) Then
     MsgBox(0, "Error", "License has expired. Please Contact the developer at rohansawantct83@gmail.com")
     ;run activation program
     Exit
EndIf

Func Dec_MagicNumber()
;Magic Number Definitions
Global $expdate = Floor(_DateToDayValue("2017", "3", "1"))
Global $g_sAppFullTitle = "Video Viewing Automator"
Global $SessionStartTime = 1130
Global $check_var=0x000000
Global $check_var2=0xCC181E
Global $CheckSiteLoad_Var2=0x222222
Global $WebSiteLink="http://videoz.bposervice.co.in/Default.aspx"
;path where default configurations are stored
Global $sSavedPath="Configurations\Default\"
Global $sLocationsPath="Configurations\Locations\"
Global $1Hour=3600
Global $1Hour_Mins=60

Global $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")

EndFunc
	Func Dec_Coordinates()
		ToolTip2("Declaring Coordinates...")
		Global $LoginTextField = LocationRead("LoginTextField",1); read the log in text field on videozbpohomepage
		Global $ClearLoginBtn = LocationRead("ClearLoginBtn",1); read the clear log in button
		Global $OpenWorkspaceBtn = LocationRead("OpenWorkspaceBtn",1); read the Open workspace button
		Global $VideoViewerCloseBtn = LocationRead("VideoViewerCloseBtn",1); read the Open workspace button
		Global $DisplayTimeUpperLeft = LocationRead("DisplayTimeUpperLeft",1); read the upperright corner of the display time dialogue box
		Global $DisplayTimeLowerRight = LocationRead("DisplayTimeLowerRight",1); readthe lowerright corner of the display time dialogue box
		ToolTip2("Done!")
		ToolTip("")
	EndFunc
		Func Dec_All()
;Declarations

;Global Declarations
Global $hardware_Current_Config, $hardware_Current_Config, $Paused, $Private_V_Ctr,$TarToday,$HusLim,$Runtime_Var21
Global $Runtime_Var22,$Runtime_Var23,$hSplash,$GLoginID
Global $GPsh_AftCyc,$GPsh_Tk1,$GPsh_Tk2,$GPsh_Tk3,$GPsh_Tk4,$Gautostartcheck,$RunTime_Var, $Runtime_Var2,$Runtime_Var3, $Runtime
Global $Runtime_Save,$LastCycle_Counter, $ChkBuff_Counter1,$ChkBuff_Var1, $ChkBuff_Var2,$Tempc,$SlpMng_TElpHour

;Initilalising
Global $FileName_Session=String(@HOUR&"-"& @MIN&" "&@MDAY &"-"& @MON &"-"& @YEAR)
Global $KeepWatching=1, $SuccessCounter=0, $SuccessfulViews=$SuccessCounter,$AttemptedViews=0, $StoredViews=0, $TotalViews1=0
Global $var2=0,$var3=0,$Video_Playing_Check=0,$CheckYouTubeLoaded_Counter=0
Global $CIAP_Var2_Counter=0, $CIAP_Error=0, $CIAP_Var1=0, $CIAP_Var3=0, $CIAP_FuncCounter=0, $CIAP_CounterLimit=0, $GCIAP=0, $CIAP_TimeLimit=0, $CIAP_Config
Global $Restart_Counter=0, $Log_Counter=0
Global $RunTime_Counter=0, $Runtime_Cycle=0, $Runtime_Raw=0
Global $iPingCtr=0,$iPingCtr2=0,$iPingCtr3=0,$iPingCtr4=0,$iPingCtr5=0
Global $ChkBuff_Var3=0, $ChkBuff_Var4=0, $LoginTimeErr_Counter=0, $VideoLoading_Errors=0, $CloseAllOtherTabs_Counter=0
Global $VideoViewer_LoadErr=0,$CheckViewer_Counter=0, $CheckVideoViewerLoaded=0, $cCounter_GUI=0, $cCounterG=0
Global $SiteLoaded_Check=0,$SiteLoad_Counter=0,$CheckSiteLoad_Click=0,$iLastCallHr=@HOUR,$iHours_LastC=0,$WCSV_Ctr=0
Global $Runtime_Cycle_Avg_Counter=0,$Runtime_Cycle_Avg_Sum=0,$Runtime_Cycle_Avg=0,$cCounter_sent=0,$iCSV_ctr=0,$iViews_ThisHour=0
Global $Session_Expired_Counter=0,$CheckIfZero_Counter=0, $ChkZeroCtr=0, $iWCSV_i=0,$TarHours,$WCSV[100][25],$iWatchRedirect=0
Global $iFirst_Run=0,$iS_Time=0, $iS_TimeDisp=0, $cCounter_push=0, $itTimes=0,$iWriteTotal=0, $iStillWatch=0, $iLoadOther=0,$Brn_Ctr=0

;Hack
Global $CustomerID="001"
Global $DaysLeft=99
EndFunc

	Func _Splash($sText)
    Local $iProgressBar, $iMsg

    SplashOff()
    $hSplash = GUICreate("", 500, 150, -1, -1, BitOR($WS_POPUP, $WS_BORDER), BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE, $WS_EX_TOOLWINDOW))
    GUISetBkColor(0xFFFFFF, $hSplash)

    GUICtrlCreateLabel($g_sAppFullTitle, 0, 10, 500, 100, $SS_CENTER)
    GUICtrlSetFont(-1, 16, 700, 0, "Arial")
    GUICtrlSetColor(-1, 0x000000)

    $iProgressBar = GUICtrlCreateProgress(100, 75, 300, 15, $PBS_MARQUEE)
    GUICtrlSendMsg($iProgressBar, $PBM_SETMARQUEE, 1, 25)

    $iMsg = GUICtrlCreateLabel($sText, 0, 125, 500, -1, $SS_CENTER)
    GUICtrlSetFont($iMsg, 8, 700, 0, "Arial")
    GUICtrlSetColor($iMsg, 0x000000)

    GUISetState(@SW_SHOW)

    Return SetExtended($iProgressBar, $iMsg)

EndFunc
;~ #NoTrayIcon
Global $hSplash
Global $hProgressSplash = _Splash("Loading...")
GUICtrlSetData($hProgressSplash, "Declaring Variables...")

;Settings
AutoItSetOption('MouseCoordMode',0)
AutoItSetOption("SendKeyDelay", 50)
Opt("WinTitleMatchMode",2)
;~ Opt("TrayMenuMode", 3)
;~ Opt("TrayOnEventMode", 1)
;~ Opt("TrayIconDebug", 1)
;~ $iTerminate = TrayCreateItem("Exit")
;~ TrayItemSetOnEvent($iTerminate, "Terminate")

HotKeySet("{END}", "TogglePause")
HotKeySet("{ESC}", "Terminate")


GUICtrlSetData($hProgressSplash, "Loading GUI...")


#Region ### START Koda GUI section ### Form=\\desktop-dvg37gp\primary\sync\megasync\languages\autoit\programs\30second\final - copy\form\form1.kxf
$MainMenu = GUICreate("Video Viewing Automator", 490, 592, -1, -1)
GUISetIcon("", -1)
$LogTab = GUICtrlCreateTab(0, 0, 489, 537, $WS_BORDER, BitOR($TCS_EX_FLATSEPARATORS,$WS_EX_STATICEDGE))
GUICtrlSetFont(-1, 10, 800, 0, "Default")
$TabSheet1 = GUICtrlCreateTabItem("Log")
$Log = GUICtrlCreateEdit("", 8, 26, 473, 465, BitOR($ES_AUTOVSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_HSCROLL,$WS_VSCROLL))
GUICtrlSetData(-1, "")
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Open_Log = GUICtrlCreateButton("Open Current Log in NotePad", 69, 501, 153, 25)
$Open_LogF = GUICtrlCreateButton("Open Log Folder", 272, 501, 153, 25)
$Options = GUICtrlCreateTabItem("Options")
$Group1 = GUICtrlCreateGroup("LogIn", 284, 371, 110, 57, BitOR($GUI_SS_DEFAULT_GROUP,$BS_LEFT,$BS_FLAT))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$LoginID = GUICtrlCreateInput("", 348, 379, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Password = GUICtrlCreateInput("", 348, 403, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$LogID = GUICtrlCreateLabel("LogInID", 288, 384, 49, 17)
$Pass = GUICtrlCreateLabel("Password", 288, 408, 58, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetCursor (-1, 0)
$Group2 = GUICtrlCreateGroup("Push Updates", 4, 371, 150, 137, BitOR($GUI_SS_DEFAULT_GROUP,$BS_LEFT,$BS_FLAT))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Psh_Tk1 = GUICtrlCreateInput("", 85, 403, 65, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Label6 = GUICtrlCreateLabel("Token", 8, 408, 40, 17)
$Psh_Chk = GUICtrlCreateCheckbox("Enable", 8, 485, 65, 17)
GUICtrlSetCursor (-1, 0)
$Label18 = GUICtrlCreateLabel("Send After Cycles", 8, 387, 105, 17)
$Psh_AftCyc = GUICtrlCreateInput("", 116, 383, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Label45 = GUICtrlCreateLabel("Token", 8, 425, 40, 17)
$Psh_Tk2 = GUICtrlCreateInput("", 85, 422, 65, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Psh_Tk3 = GUICtrlCreateInput("", 85, 441, 65, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Psh_Tk4 = GUICtrlCreateInput("", 85, 459, 65, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Label46 = GUICtrlCreateLabel("Token", 8, 442, 40, 17)
$Label47 = GUICtrlCreateLabel("Token", 7, 459, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetCursor (-1, 0)
$AutoStart = GUICtrlCreateGroup("Misc.", 157, 371, 126, 137)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label22 = GUICtrlCreateLabel("", 167, 391, 4, 4)
$autostartcheck = GUICtrlCreateCheckbox("Enable AutoStart  ", 162, 386, 113, 17)
GUICtrlSetCursor (-1, 0)
$Label28 = GUICtrlCreateLabel("CIAP Limit", 197, 408, 62, 17)
$CIAP = GUICtrlCreateInput("", 162, 406, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Label23 = GUICtrlCreateLabel("CustomerID", 197, 430, 69, 17)
$NickName_Edit = GUICtrlCreateInput("", 162, 428, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Label8 = GUICtrlCreateLabel(" Zero Limit", 197, 450, 64, 17)
$Z_Lim = GUICtrlCreateInput("", 162, 449, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
$Label14 = GUICtrlCreateLabel("Load Limit", 197, 479, 62, 17)
$L_Lim = GUICtrlCreateInput("", 162, 473, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group13 = GUICtrlCreateGroup("", 5, 26, 390, 345, BitOR($GUI_SS_DEFAULT_GROUP,$BS_LEFT,$BS_FLAT))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Group3 = GUICtrlCreateGroup("Setting Scheme 1", 13, 34, 121, 313)
$S1_Chk = GUICtrlCreateCheckbox("Enable", 18, 321, 65, 17)
GUICtrlSetCursor (-1, 0)
$Group7 = GUICtrlCreateGroup("Hustle", 21, 128, 105, 105)
$S1_HusChk = GUICtrlCreateCheckbox("Enable", 28, 212, 65, 17)
GUICtrlSetCursor (-1, 0)
$Label30 = GUICtrlCreateLabel("Limit", 31, 144, 30, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S1_HusLim = GUICtrlCreateInput("000", 73, 142, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label31 = GUICtrlCreateLabel("Before", 31, 169, 41, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S1_HusBef = GUICtrlCreateInput("000", 73, 166, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label59 = GUICtrlCreateLabel("Thres.", 31, 193, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S1_HusThres = GUICtrlCreateInput("000", 73, 188, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group8 = GUICtrlCreateGroup("Target", 21, 47, 105, 81)
$Label19 = GUICtrlCreateLabel("Today", 30, 62, 39, 17)
$S1_TarToday = GUICtrlCreateInput("000", 80, 60, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label20 = GUICtrlCreateLabel("In Hours", 30, 87, 52, 17)
GUICtrlSetFont(-1, 1, 800, 0, "MS Sans Serif")
$S1_TarHours = GUICtrlCreateInput("000", 81, 82, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$S1_TarChk = GUICtrlCreateCheckbox("Enable", 27, 107, 65, 17)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group9 = GUICtrlCreateGroup("Randomization", 21, 234, 105, 81)
$Label24 = GUICtrlCreateLabel("Target", 27, 252, 41, 17)
$S1_RandTar = GUICtrlCreateInput("000", 79, 249, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label29 = GUICtrlCreateLabel("Hustle", 27, 277, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S1_RandHus = GUICtrlCreateInput("000", 79, 272, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$S1_RandChk = GUICtrlCreateCheckbox("Enable", 25, 294, 65, 17)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group15 = GUICtrlCreateGroup("Setting Scheme 1", 138, 40, 121, 305)
$S2_Chk = GUICtrlCreateCheckbox("Enable", 143, 327, 65, 17)
GUICtrlSetCursor (-1, 0)
$Group16 = GUICtrlCreateGroup("Hustle", 146, 134, 105, 105)
$S2_HusChk = GUICtrlCreateCheckbox("Enable", 153, 218, 65, 17)
GUICtrlSetCursor (-1, 0)
$Label33 = GUICtrlCreateLabel("Limit", 156, 150, 30, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S2_HusLim = GUICtrlCreateInput("000", 198, 148, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label34 = GUICtrlCreateLabel("Before", 156, 175, 41, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S2_HusBef = GUICtrlCreateInput("000", 198, 172, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label60 = GUICtrlCreateLabel("Thres.", 156, 199, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S2_HusThres = GUICtrlCreateInput("000", 198, 194, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group17 = GUICtrlCreateGroup("Target", 146, 53, 105, 81)
$Label35 = GUICtrlCreateLabel("Today", 155, 68, 39, 17)
$S2_TarToday = GUICtrlCreateInput("000", 205, 66, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label36 = GUICtrlCreateLabel("In Hours", 155, 93, 52, 17)
GUICtrlSetFont(-1, 1, 800, 0, "MS Sans Serif")
$S2_TarHours = GUICtrlCreateInput("000", 206, 88, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$S2_TarChk = GUICtrlCreateCheckbox("Enable", 152, 113, 65, 17)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group18 = GUICtrlCreateGroup("Randomization", 146, 240, 105, 81)
$Label37 = GUICtrlCreateLabel("Target", 152, 258, 41, 17)
$S2_RandTar = GUICtrlCreateInput("000", 204, 255, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label38 = GUICtrlCreateLabel("Hustle", 152, 283, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S2_RandHus = GUICtrlCreateInput("000", 204, 278, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$S2_RandChk = GUICtrlCreateCheckbox("Enable", 150, 300, 65, 17)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group19 = GUICtrlCreateGroup("Setting Scheme 1", 264, 40, 121, 305)
$Group20 = GUICtrlCreateGroup("Hustle", 272, 134, 105, 105)
$S3_HusChk = GUICtrlCreateCheckbox("Enable", 279, 218, 65, 17)
GUICtrlSetCursor (-1, 0)
$Label39 = GUICtrlCreateLabel("Limit", 282, 150, 30, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S3_HusLim = GUICtrlCreateInput("000", 324, 148, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label40 = GUICtrlCreateLabel("Before", 282, 175, 41, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S3_HusBef = GUICtrlCreateInput("000", 324, 172, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label61 = GUICtrlCreateLabel("Thres.", 282, 199, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S3_HusThres = GUICtrlCreateInput("000", 324, 194, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group21 = GUICtrlCreateGroup("Target", 272, 53, 105, 81)
$Label41 = GUICtrlCreateLabel("Today", 281, 68, 39, 17)
$S3_TarToday = GUICtrlCreateInput("000", 331, 66, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label42 = GUICtrlCreateLabel("In Hours", 281, 93, 52, 17)
GUICtrlSetFont(-1, 1, 800, 0, "MS Sans Serif")
$S3_TarHours = GUICtrlCreateInput("000", 332, 88, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$S3_TarChk = GUICtrlCreateCheckbox("Enable", 278, 113, 65, 17)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group22 = GUICtrlCreateGroup("Randomization", 272, 240, 105, 81)
$Label43 = GUICtrlCreateLabel("Target", 278, 258, 41, 17)
$S3_RandTar = GUICtrlCreateInput("000", 330, 255, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label44 = GUICtrlCreateLabel("Hustle", 278, 283, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S3_RandHus = GUICtrlCreateInput("000", 330, 278, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$S3_RandChk = GUICtrlCreateCheckbox("Enable", 276, 300, 65, 17)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$S3_Chk = GUICtrlCreateCheckbox("Enable", 269, 327, 65, 17)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Chk_SRand = GUICtrlCreateCheckbox("Enable Scheme Randomization", 14, 351, 193, 17)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetCursor (-1, 0)
$Group23 = GUICtrlCreateGroup("Screenshots", 397, 31, 81, 108)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$ScrSht_FChk = GUICtrlCreateCheckbox("Fail", 402, 51, 41, 17)
GUICtrlSetCursor (-1, 0)
$ScrSht_SChk = GUICtrlCreateCheckbox("Success", 402, 74, 65, 17)
GUICtrlSetCursor (-1, 0)
$ScrSht_OpnFld = GUICtrlCreateButton("Open Folder", 401, 95, 73, 17)
$ScrSht_DelAll = GUICtrlCreateButton("Delete All", 401, 115, 73, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group24 = GUICtrlCreateGroup("Log", 397, 140, 81, 65)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Log_OpnFld = GUICtrlCreateButton("Open Folder", 401, 154, 73, 17)
$Log_DelAll = GUICtrlCreateButton("Delete All", 401, 180, 73, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group25 = GUICtrlCreateGroup("Coordinates", 397, 206, 81, 65)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label48 = GUICtrlCreateLabel("X +/-", 407, 228, 33, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$Label49 = GUICtrlCreateLabel("Y +/-", 407, 249, 33, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$Coord_x = GUICtrlCreateInput("00", 444, 221, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Coord_y = GUICtrlCreateInput("00", 443, 242, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Save_All = GUICtrlCreateButton("Save All", 203, 509, 83, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Group36 = GUICtrlCreateGroup("Calibration", 397, 273, 81, 97)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Calibrate_Del = GUICtrlCreateButton("Delete All", 401, 333, 73, 17)
$Calibrate_Btn = GUICtrlCreateButton("Start", 401, 302, 73, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group37 = GUICtrlCreateGroup("Shutdown", 395, 371, 81, 57)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Chk_Shtdwn = GUICtrlCreateCheckbox("Enable", 406, 398, 57, 17)
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group38 = GUICtrlCreateGroup("Settings Profile", 285, 428, 193, 41)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Button7 = GUICtrlCreateButton("Save Current", 292, 446, 81, 17)
$Button9 = GUICtrlCreateButton("Load New ", 387, 446, 81, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group39 = GUICtrlCreateGroup("Minimum Internet Speed", 285, 469, 193, 41)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label57 = GUICtrlCreateLabel("Google Ping", 292, 487, 73, 17)
$G_Ping = GUICtrlCreateInput("", 426, 484, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet2 = GUICtrlCreateTabItem("Stats")
GUICtrlSetState(-1,$GUI_SHOW)
$Group4 = GUICtrlCreateGroup("Errors", 5, 389, 473, 65)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$pauses = GUICtrlCreateLabel("Video Auto Pause", 16, 405, 105, 17)
$VAPE = GUICtrlCreateEdit("", 128, 400, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label2 = GUICtrlCreateLabel("Private Videos", 16, 424, 86, 17)
$ChkZeroErrGUI = GUICtrlCreateEdit("", 278, 422, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label3 = GUICtrlCreateLabel("Restarts", 367, 424, 51, 17)
$Rsrt = GUICtrlCreateEdit("", 430, 422, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label9 = GUICtrlCreateLabel("Check Zero", 199, 424, 70, 17)
$PrivVideoGUI = GUICtrlCreateEdit("", 128, 422, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label10 = GUICtrlCreateLabel("Session Expired", 335, 400, 94, 17)
$Session_Expired_Counter_GUI = GUICtrlCreateEdit("", 430, 400, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label11 = GUICtrlCreateLabel("Video Loading", 527, 380, 85, 17)
$ShrtVideo = GUICtrlCreateEdit("", 278, 400, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label21 = GUICtrlCreateLabel("", 16, 443, 4, 4)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label13 = GUICtrlCreateLabel("Short Videos", 203, 405, 76, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$basicstarts = GUICtrlCreateGroup("Time", 126, 30, 230, 145)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$RunTime = GUICtrlCreateLabel("Runtime", 132, 44, 50, 17)
$Runtimefrm = GUICtrlCreateEdit("", 182, 42, 57, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00:00:00")
GUICtrlSetCursor (-1, 2)
$Group26 = GUICtrlCreateGroup("Cycles", 133, 61, 89, 105)
$lstcycle = GUICtrlCreateEdit("", 137, 79, 81, 81, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_VSCROLL))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group27 = GUICtrlCreateGroup("Avg.", 241, 38, 110, 89)
$Group28 = GUICtrlCreateGroup("Neces", 297, 50, 49, 41)
$Cycle_Nece = GUICtrlCreateEdit("", 305, 67, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0.00")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group29 = GUICtrlCreateGroup("Curr.", 245, 50, 49, 41)
$Cycle_Avg = GUICtrlCreateEdit("", 249, 67, 41, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00:00")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label63 = GUICtrlCreateLabel("S. Avg", 250, 104, 42, 17)
$S_Avg = GUICtrlCreateEdit("", 307, 103, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0.00")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$dwntime = GUICtrlCreateEdit("", 292, 147, 57, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$internetdwn = GUICtrlCreateLabel("Downtime", 230, 148, 59, 17)
$Label56 = GUICtrlCreateLabel("Uptime", 230, 130, 43, 17)
$UPtime = GUICtrlCreateEdit("", 292, 129, 57, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Mini = GUICtrlCreateGroup("Mini-Log", 5, 453, 473, 73)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Log2 = GUICtrlCreateEdit("", 9, 471, 465, 49, BitOR($ES_AUTOVSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_VSCROLL,$WS_BORDER))
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group5 = GUICtrlCreateGroup("Economics", 359, 30, 117, 145)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label4 = GUICtrlCreateLabel("Total ", 364, 89, 37, 17)
$Eco_Total = GUICtrlCreateEdit("", 410, 85, 38, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label5 = GUICtrlCreateLabel("Rate", 364, 57, 31, 17)
$Eco_Rate = GUICtrlCreateEdit("", 409, 57, 38, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label16 = GUICtrlCreateLabel("Rs.", 451, 57, 23, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$Label17 = GUICtrlCreateLabel("Rs.", 451, 86, 23, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$Label54 = GUICtrlCreateLabel("Target", 364, 124, 41, 17)
$Eco_Tar = GUICtrlCreateEdit("", 410, 121, 38, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label55 = GUICtrlCreateLabel("Rs.", 451, 125, 23, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group6 = GUICtrlCreateGroup("Target", 5, 173, 241, 105)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Group10 = GUICtrlCreateGroup("Hour", 15, 189, 110, 57)
$Group30 = GUICtrlCreateGroup("Neces", 71, 201, 49, 41)
$Tar_Hr_Nece = GUICtrlCreateEdit("", 83, 219, 25, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group31 = GUICtrlCreateGroup("Done", 19, 201, 49, 41)
$Tar_Hr_Done = GUICtrlCreateEdit("", 31, 219, 25, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group11 = GUICtrlCreateGroup("Today", 130, 188, 110, 57)
$Group32 = GUICtrlCreateGroup("Neces", 186, 200, 49, 41)
$Tar_Today_Nece = GUICtrlCreateEdit("", 198, 218, 25, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group33 = GUICtrlCreateGroup("Done", 134, 200, 49, 41)
$Tar_Today_Done = GUICtrlCreateEdit("", 146, 218, 25, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label1 = GUICtrlCreateLabel("Achieving Possible Today?", 13, 258, 157, 17)
GUICtrlSetFont(-1, 7, 800, 0, "MS Sans Serif")
$Tar_AchPos = GUICtrlCreateEdit("", 190, 254, 41, 17, BitOR($ES_CENTER,$ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "Yes")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group14 = GUICtrlCreateGroup("Views", 5, 29, 119, 145)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label50 = GUICtrlCreateLabel("Successful", 10, 45, 66, 17)
$Label51 = GUICtrlCreateLabel("Attempted", 10, 67, 61, 17)
$S_View = GUICtrlCreateEdit("", 85, 44, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor (-1, 2)
$A_View = GUICtrlCreateEdit("", 85, 61, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor (-1, 2)
$Group12 = GUICtrlCreateGroup("S. Rate", 43, 116, 57, 49)
$S_Rate = GUICtrlCreateEdit("", 48, 137, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
$Label15 = GUICtrlCreateLabel("%", 85, 137, 13, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label7 = GUICtrlCreateLabel("Hustled", 10, 85, 47, 17)
$Edit12 = GUICtrlCreateEdit("", 85, 84, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group35 = GUICtrlCreateGroup("Randomization", 5, 278, 145, 112)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label26 = GUICtrlCreateLabel("Target", 11, 296, 41, 17)
$Rand_Tar = GUICtrlCreateInput("000", 111, 293, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$ES_READONLY,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label52 = GUICtrlCreateLabel("Hustle", 11, 329, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$Rand_Hus = GUICtrlCreateInput("000", 111, 324, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$ES_READONLY,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
$Label53 = GUICtrlCreateLabel("Setting Scheme", 11, 361, 93, 17)
$Rand_Setting = GUICtrlCreateInput("000", 112, 355, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$ES_READONLY,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor (-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group40 = GUICtrlCreateGroup("Expiry", 249, 221, 229, 57)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label58 = GUICtrlCreateLabel("Days left for License to Expire", 259, 244, 175, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
$Expirydate_gui = GUICtrlCreateEdit("", 439, 244, 25, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group34 = GUICtrlCreateGroup("Expiry", 249, 175, 229, 47)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label12 = GUICtrlCreateLabel("PushBullet Alerts Sent", 267, 198, 130, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
$Psh_Sent = GUICtrlCreateEdit("", 431, 196, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor (-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group41 = GUICtrlCreateGroup("Coming Soon!", 154, 280, 325, 110)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label62 = GUICtrlCreateLabel("Coming Soon! :)", 269, 339, 94, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet3 = GUICtrlCreateTabItem("About")
$Credits = GUICtrlCreateLabel("Developer - Rohan Sawant", 173, 74, 157, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Contact = GUICtrlCreateLabel("Email- rohansawantct83@gmail.com", 148, 53, 207, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label32 = GUICtrlCreateLabel("© 2016 Rohan Sawant All Rights Reserved", 78, 29, 347, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
GUICtrlCreateTabItem("")
GUICtrlSetCursor (-1, 0)
$Start = GUICtrlCreateButton("Start ", 0, 560, 97, 25, $BS_PUSHLIKE)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
GUICtrlSetCursor (-1, 0)
$Label25 = GUICtrlCreateLabel("© 2016 Rohan Sawant All Rights Reserved", 234, 560, 249, 17)
GUICtrlSetFont(-1, 7, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label27 = GUICtrlCreateLabel("Today", 384, 4, 49, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$TotalViews = GUICtrlCreateEdit("", 440, 4, 41, 17, BitOR($ES_NOHIDESEL,$ES_READONLY,$ES_WANTRETURN))
$N_Name = GUICtrlCreateEdit("", 280, 7, 73, 17, BitOR($ES_NOHIDESEL,$ES_READONLY,$ES_WANTRETURN))
$Edit1 = GUICtrlCreateEdit("", 104, 568, 65, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, ""&Chr(39)&"Esc"&Chr(39)&" to Stop")
GUICtrlSetFont(-1, 2, 400, 0, "MS Sans Serif")
$PrgBar1 = GUICtrlCreateProgress(0, 536, 489, 17)
Dim $MainMenu_AccelTable[1][2] = [["{INS}", $Start]]
GUISetAccelerators($MainMenu_AccelTable)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


FirstLoad()
Func FirstLoad()
GUICtrlSetData($hProgressSplash, "Finishing...")
GUIDelete($hSplash)
;this might return errors

Calc_Runtime(0)
GUI_VarAll()
SetGUIValues()
Load_All()
GUI_VarAll()
;~ Time_Set()

;~  Hack CheckKey()
;~  Hack ExpiryGUI()
Config_ActSettings()
Get_Earnings(0)
Get_TargetEarnings()
CurrentProgress(75)
Push_AllInfo($GPsh_AftCyc,$GPsh_Tk1,$GPsh_Tk2,$GPsh_Tk3,$GPsh_Tk4,"Initialised @ "&@HOUR&":"& @MIN&":"&@SEC,"VVA Initialised on PC:"&@ComputerName&" using ID:"&String($GLoginID))
;~ Push_AllInfo($GPsh_AftCyc,$GPsh_Tk1,$GPsh_Tk2,$GPsh_Tk3,$GPsh_Tk4,"","",1)
CurrentProgress(100)
CurrentProgress(0)
ToolTip2("Completed Loading!")
ToolTip("")

Local $iTemp=$TarToday/$TarHours
GUICtrlSetData($Tar_Hr_Nece,Int($iTemp))
$iTemp=60/$iTemp
$iTemp=Sec2Time($iTemp*3600)
ToolTip2("Time Neces : "&$iTemp)
GUICtrlSetData($Cycle_Nece,$iTemp)
GUICtrlSetData($Tar_Today_Nece,$TarToday)

CurrentProgress(0)
Dec_Coordinates()
AdlibRegister("Update_Runtime",750)
AutoStartCheck($Gautostartcheck)
Check_TargetAchieved()
GUI_Loop()
EndFunc

Func GUI_Loop()
CurrentProgress(0)
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Save_All
			Save_All()
			FirstLoad()
		Case $Start
			GUICtrlSetState($TabSheet2,$GUI_SHOW)
			Brain()
		Case $Open_Log
			ToolTip2("Opening Log...")
			ShellExecute("Logs\"&$FileName_Session&".txt")
		Case $Open_LogF
			ToolTip2("Opening Log Folder")
			ShellExecute("Logs\")
		Case $Calibrate_Btn
			Calibrate_Main()
		Case $Calibrate_Del
			Calibrate_Del()
			Calibrate_Main()
	EndSwitch
Sleep(10)
WEnd
EndFunc

;To successfully add save data functionality to new features, Add the GUIfield name and the variable name to the GUI_VarAll function, then Add the same to the dir load function, then the same to the Save_All function. and follow the pre written pattern in case you want to add checkboxes and stuff.
Func GUI_VarAll() ;push all gui fields in to variable using gui read
;Setting Scheme1

Global $GS1_TarToday=GUICtrlRead($S1_TarToday)
Global $GS1_TarHours=GUICtrlRead($S1_TarHours)
If _IsChecked($S1_TarChk) Then
Global $GS1_TarChk=1
Else
Global $GS1_TarChk=0
EndIf

Global $GS1_HusLim=GUICtrlRead($S1_HusLim)
Global $GS1_HusBef=GUICtrlRead($S1_HusBef)
Global $GS1_HusThres=GUICtrlRead($S1_HusThres)
If _IsChecked($S1_HusChk) Then
Global $GS1_HusChk=1
Else
Global $GS1_HusChk=0
EndIf

;randomization
Global $GS1_RandTar=GUICtrlRead($S1_RandTar)
Global $GS1_RandHus=GUICtrlRead($S1_RandHus)
If _IsChecked($S1_RandChk) Then
Global $GS1_RandChk=1
Else
Global $GS1_RandChk=0
EndIf


If _IsChecked($S1_Chk) Then
Global $GS1_Chk=1
Else
Global $GS1_Chk=0
EndIf


;Setting Scheme 2
Global $GS2_TarToday=GUICtrlRead($S2_TarToday)
Global $GS2_TarHours=GUICtrlRead($S2_TarHours)
If _IsChecked($S2_TarChk) Then
Global $GS2_TarChk=1
Else
Global $GS2_TarChk=0
EndIf

Global $GS2_HusLim=GUICtrlRead($S2_HusLim)
Global $GS2_HusBef=GUICtrlRead($S2_HusBef)
Global $GS2_HusThres=GUICtrlRead($S2_HusThres)
If _IsChecked($S2_HusChk) Then
Global $GS2_HusChk=1
Else
Global $GS2_HusChk=0
EndIf

Global $GS2_RandTar=GUICtrlRead($S2_RandTar)
Global $GS2_RandHus=GUICtrlRead($S2_RandHus)
If _IsChecked($S2_RandChk) Then
Global $GS2_RandChk=1
Else
Global $GS2_RandChk=0
EndIf


If _IsChecked($S2_Chk) Then
Global $GS2_Chk=1
Else
Global $GS2_Chk=0
EndIf

;Setting Scheme 3
Global $GS3_TarToday=GUICtrlRead($S3_TarToday)
Global $GS3_TarHours=GUICtrlRead($S3_TarHours)
If _IsChecked($S3_TarChk) Then
Global $GS3_TarChk=1
Else
Global $GS3_TarChk=0
EndIf

Global $GS3_HusLim=GUICtrlRead($S3_HusLim)
Global $GS3_HusBef=GUICtrlRead($S3_HusBef)
Global $GS3_HusThres=GUICtrlRead($S3_HusThres)
If _IsChecked($S3_HusChk) Then
Global $GS3_HusChk=1
Else
Global $GS3_HusChk=0
EndIf

Global $GS3_RandTar=GUICtrlRead($S3_RandTar)
Global $GS3_RandHus=GUICtrlRead($S3_RandHus)
If _IsChecked($S3_RandChk) Then
Global $GS3_RandChk=1
Else
Global $GS3_RandChk=0
EndIf


If _IsChecked($S3_Chk) Then
Global $GS3_Chk=1
Else
Global $GS3_Chk=0
EndIf


;Push Bullet Updates
Global $GPsh_AftCyc=GUICtrlRead($Psh_AftCyc)
Global $GPsh_Tk1=GUICtrlRead($Psh_Tk1)
Global $GPsh_Tk2=GUICtrlRead($Psh_Tk2)
Global $GPsh_Tk3=GUICtrlRead($Psh_Tk3)
Global $GPsh_Tk4=GUICtrlRead($Psh_Tk4)
If _IsChecked($Psh_Chk) Then
Global $GPsh_Chk=1
Else
Global $GPsh_Chk=0
EndIf


;Misc
If _IsChecked($autostartcheck) Then
Global $Gautostartcheck=1
Else
Global $Gautostartcheck=0
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
Global $GScrSht_FChk=1
Else
Global $GScrSht_FChk=0
EndIf

;google ping minimum speed
Global $GG_Ping=GUICtrlRead($G_Ping)

If _IsChecked($ScrSht_SChk) Then
Global $GScrSht_SChk=1
Else
Global $GScrSht_SChk=0
EndIf


;Coordinate Offsets
Global $GCoord_x=GUICtrlRead($Coord_x)
Global $GCoord_y=GUICtrlRead($Coord_y)

;scheme randomization
If _IsChecked($Chk_SRand) Then
Global $GChk_SRand=1
Else
Global $GChk_SRand=0
EndIf

If _IsChecked($Chk_Shtdwn) Then
Global $GChk_Shtdwn=1
Else
Global $GChk_Shtdwn=0
EndIf

EndFunc

Func Load_All();read current gui values into variables before writing them to save in a file
Dir_Load(0,"Target1", "GS1_TarToday", $S1_TarToday)
Dir_Load(0,"Target1", "GS1_TarHours", $S1_TarHours)
$GS1_TarChk=Dir_Load(0,"Target1", "GS1_TarChk", $GS1_TarChk)
Dir_Load(0,"Hustle1", "GS1_HusLim", $S1_HusLim)
Dir_Load(0,"Hustle1", "GS1_HusBef", $S1_HusBef)
Dir_Load(0,"Hustle1", "GS1_HusThres", $S1_HusThres)
$GS1_HusChk=Dir_Load(0,"Hustle1", "GS1_HusChk", $GS1_HusChk)
Dir_Load(0,"Randomization1", "GS1_RandTar", $S1_RandTar)
Dir_Load(0,"Randomization1", "GS1_RandHus", $S1_RandHus)
$GS1_RandChk=Dir_Load(0,"Randomization1", "GS1_RandChk", $GS1_RandChk)
$GS1_Chk=Dir_Load(0,"Scheme1", "GS1_Chk", $GS1_Chk)
CurrentProgress(10)

Dir_Load(0,"Target2", "GS2_TarToday", $S2_TarToday)
Dir_Load(0,"Target2", "GS2_TarHours", $S2_TarHours)
$GS2_TarChk=Dir_Load(0,"Target2", "GS2_TarChk", $GS2_TarChk)
Dir_Load(0,"Hustle2", "GS2_HusLim", $S2_HusLim)
Dir_Load(0,"Hustle2", "GS2_HusBef", $S2_HusBef)
Dir_Load(0,"Hustle2", "GS2_HusThres", $S2_HusThres)
$GS2_HusChk=Dir_Load(0,"Hustle2", "GS2_HusChk", $GS2_HusChk)
Dir_Load(0,"Randomization2", "GS2_RandTar", $S2_RandTar)
Dir_Load(0,"Randomization2", "GS2_RandHus", $S2_RandHus)
$GS2_RandChk=Dir_Load(0,"Randomization2", "GS2_RandChk", $GS2_RandChk)
$GS2_Chk=Dir_Load(0,"Scheme2", "GS2_Chk", $GS2_Chk)
CurrentProgress(20)

Dir_Load(0,"Target3", "GS3_TarToday", $S3_TarToday)
Dir_Load(0,"Target3", "GS3_TarHours", $S3_TarHours)
$GS3_TarChk=Dir_Load(0,"Target3", "GS3_TarChk", $GS3_TarChk)
Dir_Load(0,"Hustle3", "GS3_HusLim", $S3_HusLim)
Dir_Load(0,"Hustle3", "GS3_HusBef", $S3_HusBef)
Dir_Load(0,"Hustle3", "GS3_HusThres", $S3_HusThres)
$GS3_HusChk=Dir_Load(0,"Hustle3", "GS3_HusChk", $GS3_HusChk)
Dir_Load(0,"Randomization3", "GS3_RandTar", $S3_RandTar)
Dir_Load(0,"Randomization3", "GS3_RandHus", $S3_RandHus)
$GS3_RandChk=Dir_Load(0,"Randomization3", "GS3_RandChk", $GS3_RandChk)
$GS3_Chk=Dir_Load(0,"Scheme3", "GS3_Chk", $GS3_Chk)
CurrentProgress(30)

Dir_Load(0,"Pushbullet", "GPsh_AftCyc", $Psh_AftCyc)
Dir_Load(0,"Pushbullet", "GPsh_Tk1", $Psh_Tk1)
Dir_Load(0,"Pushbullet", "GPsh_Tk2", $Psh_Tk2)
Dir_Load(0,"Pushbullet", "GPsh_Tk3", $Psh_Tk3)
Dir_Load(0,"Pushbullet", "GPsh_Tk4", $Psh_Tk4)
$GPsh_Chk=Dir_Load(0,"Pushbullet", "GPsh_Chk", $GPsh_Chk)
CurrentProgress(40)

$Gautostartcheck=Dir_Load(0,"Misc", "Gautostartcheck", $Gautostartcheck)
Dir_Load(0,"Misc", "GCIAP", $CIAP)
Dir_Load(0,"Misc", "GNickName_Edit", $NickName_Edit)
Dir_Load(0,"Misc", "GZ_Lim", $Z_Lim)
Dir_Load(0,"Misc", "GL_Lim", $L_Lim)
CurrentProgress(50)

Dir_Load(0,"LogIn", "GLoginID", $LoginID)
Dir_Load(0,"LogIn", "GPassword", $Password)


Dir_Load(0,"Ping", "GG_Ping", $G_Ping)

$GScrSht_FChk=Dir_Load(0,"Screenshot", "GScrSht_FChk", $GScrSht_FChk)
$GScrSht_SChk=Dir_Load(0,"Screenshot", "GScrSht_SChk", $GScrSht_SChk)

Dir_Load(0,"Coordinates", "GCoord_x", $Coord_x)
Dir_Load(0,"Coordinates", "GCoord_y", $Coord_y)

Global $GWatchCounterLim1
If Not _FileReadToArray($sSavedPath&"Misc\GWatchCounterLim.ct83",$GWatchCounterLim1, 0) Then
EndIf
Global $GWatchCounterLim = _ArrayToString($GWatchCounterLim1)



$GChk_SRand=Dir_Load(0,"Scheme_Random", "GChk_SRand", $GChk_SRand)
CheckIfTrue($Chk_SRand,$GChk_SRand)

;load which checkboxes are checked and which are not
CheckIfTrue($autostartcheck,$Gautostartcheck)

;Auto-Shutdown
$GChk_Shtdwn=Dir_Load(0,"Shutdown", "GChk_Shtdwn", $GChk_Shtdwn)
CheckIfTrue($Chk_Shtdwn,$GChk_Shtdwn)

;Setting Scheme 1
CheckIfTrue($S1_TarChk,$GS1_TarChk)
CheckIfTrue($S1_HusChk,$GS1_HusChk)
CheckIfTrue($S1_RandChk,$GS1_RandChk)
CheckIfTrue($S1_Chk,$GS1_Chk)
CurrentProgress(60)

;Setting Scheme 2
CheckIfTrue($S2_TarChk,$GS2_TarChk)
CheckIfTrue($S2_HusChk,$GS2_HusChk)
CheckIfTrue($S2_RandChk,$GS2_RandChk)
CheckIfTrue($S2_Chk,$GS2_Chk)
CurrentProgress(70)
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

;scheme randomization
CheckIfTrue($Chk_SRand,$GChk_SRand)

Global $LoginID1 = $GLoginID
Global $Password1 = $GPassword
Global $NickName_1 = $GNickName_Edit
;~ Global $GCIAP = Int($GCIAP)
ToolTip2("Previously Saved Data Loaded!")
EndFunc
	Func Dir_Load($iChoice,$cS_Group,$cS_Name,$cVData,$sSavedPath="Configurations\Default\") ;this function loads whats stored in the ct83 files and sets them usign guictrlset but for boolean values it loads 1 or 0 and then returns the same. then checkiftrue fucntion is used to check if returned is 1 or 0 and then set the values as checked or unchecked
Local $cCurrent_Path=String($sSavedPath&$cS_Group&"\"&$cS_Name&".ct83")
Local $cFileData
If Not _FileReadToArray($cCurrent_Path,$cFileData, 0) Then
ToolTip2($cS_Group&"\"&$cS_Name &".ct83 File not found ")
EndIf
Local $cFileData1 = _ArrayToString($cFileData)
ToolTip2("Loading:"&$cFileData1&" from : "&$cCurrent_Path)
GUICtrlSetData($cVData,$cFileData1)
Return $cFileData1
Endfunc
		Func CheckIfTrue($ChckBoxVar,$ChckBoxData); loads the values of checked and unchecked check boxes from the saved files
$ChckBoxData=String($ChckBoxData)
If $ChckBoxData=0 Or $ChckBoxData="0" Then
	GUICtrlSetState($ChckBoxVar, $GUI_UNCHECKED)
	ToolTip2($ChckBoxVar&" is UnChecked.")
Else
	GUICtrlSetState($ChckBoxVar, $GUI_CHECKED)
	ToolTip2($ChckBoxVar&" is Checked.")
EndIf
EndFunc

Func Save_All() ;save all pushed varibles into .ct83 files
;read current gui values into variables before writing them to save in a file
GUI_VarAll()
CurrentProgress(10)
Dir_Save("Target1", "GS1_TarToday", $GS1_TarToday)
Dir_Save("Target1", "GS1_TarHours", $GS1_TarHours)
Dir_Save("Target1", "GS1_TarChk", $GS1_TarChk)
Dir_Save("Hustle1", "GS1_HusLim", $GS1_HusLim)
Dir_Save("Hustle1", "GS1_HusBef", $GS1_HusBef)
Dir_Save("Hustle1", "GS1_HusThres", $GS1_HusThres)
Dir_Save("Hustle1", "GS1_HusChk", $GS1_HusChk)
Dir_Save("Randomization1", "GS1_RandTar", $GS1_RandTar)
Dir_Save("Randomization1", "GS1_RandHus", $GS1_RandHus)
Dir_Save("Randomization1", "GS1_RandChk", $GS1_RandChk)
Dir_Save("Scheme1", "GS1_Chk", $GS1_Chk)
CurrentProgress(20)
Dir_Save("Target2", "GS2_TarToday", $GS2_TarToday)
Dir_Save("Target2", "GS2_TarHours", $GS2_TarHours)
Dir_Save("Target2", "GS2_TarChk", $GS2_TarChk)
Dir_Save("Hustle2", "GS2_HusLim", $GS2_HusLim)
Dir_Save("Hustle2", "GS2_HusBef", $GS2_HusBef)
Dir_Save("Hustle2", "GS2_HusThres", $GS2_HusThres)
Dir_Save("Hustle2", "GS2_HusChk", $GS2_HusChk)
Dir_Save("Randomization2", "GS2_RandTar", $GS2_RandTar)
Dir_Save("Randomization2", "GS2_RandHus", $GS2_RandHus)
Dir_Save("Randomization2", "GS2_RandChk", $GS2_RandChk)
Dir_Save("Scheme2", "GS2_Chk", $GS2_Chk)
CurrentProgress(30)
Dir_Save("Target3", "GS3_TarToday", $GS3_TarToday)
Dir_Save("Target3", "GS3_TarHours", $GS3_TarHours)
Dir_Save("Target3", "GS3_TarChk", $GS3_TarChk)
Dir_Save("Hustle3", "GS3_HusLim", $GS3_HusLim)
Dir_Save("Hustle3", "GS3_HusBef", $GS3_HusBef)
Dir_Save("Hustle3", "GS3_HusThres", $GS3_HusThres)
Dir_Save("Hustle3", "GS3_HusChk", $GS3_HusChk)
Dir_Save("Randomization3", "GS3_RandTar", $GS3_RandTar)
Dir_Save("Randomization3", "GS3_RandHus", $GS3_RandHus)
Dir_Save("Randomization3", "GS3_RandChk", $GS3_RandChk)
Dir_Save("Scheme3", "GS3_Chk", $GS3_Chk)
CurrentProgress(40)

Dir_Save("Pushbullet", "GPsh_AftCyc", $GPsh_AftCyc)
Dir_Save("Pushbullet", "GPsh_Tk1", $GPsh_Tk1)
Dir_Save("Pushbullet", "GPsh_Tk2", $GPsh_Tk2)
Dir_Save("Pushbullet", "GPsh_Tk3", $GPsh_Tk3)
Dir_Save("Pushbullet", "GPsh_Tk4", $GPsh_Tk4)
Dir_Save("Pushbullet", "GPsh_Chk", $GPsh_Chk)
CurrentProgress(50)
Dir_Save("Misc", "Gautostartcheck", $Gautostartcheck)
Dir_Save("Misc", "GCIAP", $GCIAP)
Dir_Save("Misc", "GNickName_Edit", $GNickName_Edit)
Dir_Save("Misc", "GZ_Lim", $GZ_Lim)
Dir_Save("Misc", "GL_Lim", $GL_Lim)
CurrentProgress(60)
Dir_Save("Ping", "GG_Ping", $GG_Ping)

Dir_Save("LogIn", "GLoginID", $GLoginID)
Dir_Save("LogIn", "GPassword", $GPassword)
CurrentProgress(70)
Dir_Save("Screenshot", "GScrSht_FChk", $GScrSht_FChk)
Dir_Save("Screenshot", "GScrSht_SChk", $GScrSht_SChk)
CurrentProgress(80)
Dir_Save("Coordinates", "GCoord_x", $GCoord_x)
Dir_Save("Coordinates", "GCoord_y", $GCoord_y)

Dir_Save("Scheme_Random", "GChk_SRand", $GChk_SRand)

Dir_Save("Shutdown", "GChk_Shtdwn", $GChk_Shtdwn)

CurrentProgress(100)
ToolTip2("Saved All Data!")
EndFunc
	Func Dir_Save($cS_Group,$cS_Name,$cData,$sSavedPath="Configurations\Default\");Writes the the typed data in to .ct83 files. GUIvarall needs to be run before this to add all the gui values in to resp. variables
Local $cCurrent_Path=String($sSavedPath&$cS_Group&"\"&$cS_Name&".ct83")
$cData=String($cData)
If FileExists($cCurrent_Path) Then
	FileDelete($cCurrent_Path)
EndIf
DirCreate(String($sSavedPath&$cS_Group&"\"))
ToolTip2("Saving '"&$cData&"'in : "&$cCurrent_Path)
FileWrite($cCurrent_Path,$cData)
Endfunc
		Func SetGUIValues()

;settings
CurrentProgress(20)
Runtime_Cycle_Avg()
UpdateViewsToday()

;~ CheckNeedToHustle()
Global $RTime_Secs=Calc_Runtime(0)
Global $Hours_Els=TimeElap_Hour($RTime_Secs)
Global $iV_Hour=ViewsThisHr("return")
Global $iTarHour=GUICtrlRead($Tar_Hr_Nece)
GUICtrlSetData($Tar_Today_Done,$SuccessfulViews)
ToolTip2("Setting $ViewsThisHr as: "&$iV_Hour)
GUICtrlSetData($Tar_Hr_Done,$iV_Hour)
$iTime_ElspHr_Mins=Calc_Runtime(0)
$iTime_ElspHr_Mins=$iTime_ElspHr_Mins/60
;~ CheckNeedToHustle($iV_Hour,$iTarHour,$iTime_ElspHr_Mins)

CurrentProgress(50)
;basic_stats
GUICtrlSetData($S_View,$SuccessfulViews)
GUICtrlSetData($A_View,$AttemptedViews)
GUICtrlSetData($S_Rate,$SuccessfulViews/$AttemptedViews*100)
Global $sTime = _TimeSystemRestart(2)
GUICtrlSetData($UPtime,$sTime)
		EndFunc

Func TimeElap_Hour($SlpMng_TElp)
ToolTip2("Time Elapsed Hour called")
Local $TimeElap_Hour
If($SlpMng_TElp>$1Hour) Then
	ToolTip2("While Looping to find the number of Hours Elapsed...")
	While ($SlpMng_TElp>$1Hour)
		$SlpMng_TElp=$SlpMng_TElp-$1Hour
		$Hours_Els=$Hours_Els+1
	WEnd
	ToolTip2("Hours Elapsed : "&$Hours_Els)
;~ 	MsgBox("","","Hours Elasped are : "&$Hours_Els) ;remove this, this is the number of hours elapsed
	Return $Hours_Els
Else
	Return $Hours_Els
EndIf
EndFunc
	Func ViewsThisHr($iChoice) ;timeelap hour func needs to be called before this for var $Hours_Els
Switch $iChoice
	Case "add"
		If $Hours_Els = $iHours_LastC Then
			ToolTip2("Hour same as last hour. Incrementing Views")
			$iViews_ThisHour=$iViews_ThisHour+1
			ToolTip2("Views this Hour: "&$iViews_ThisHour)
;~ 			$aT_Views[$Hours_Els][$iViews_ThisHour]=1
		Else
			ToolTip2("Next Hour. Views Zeroed. (1)")
			$iHours_LastC=$Hours_Els
			$iViews_ThisHour=1
			ToolTip2("Views this Hour: "&$iViews_ThisHour)
			Return $iViews_ThisHour
		EndIf
	$iHours_LastC=$Hours_Els
	Case "return"
		Return $iViews_ThisHour
EndSwitch
EndFunc
		Func CheckNeedToHustle($iViews_ThisHour,$iTarget_perHour,$iTime_ElspHr_Mins)
ToolTip2("Checking Hustle is Necessary...")
Local $bIsHusNece
ToolTip2("("&$1Hour_Mins&"-"&$iTime_ElspHr_Mins&")/("&$iTarget_perHour&"-"&$iViews_ThisHour&") Comparing With ("&$1Hour_Mins&")/("&$iTarget_perHour&")")
If ($1Hour_Mins-$iTime_ElspHr_Mins)/($iTarget_perHour-$iViews_ThisHour) > ($1Hour_Mins)/($iTarget_perHour) Then
;~ 	$bIsHusNece=False
	GUICtrlSetData($Tar_AchPos,"Yes!")
;~ 	ToolTip2("Hustle Not necessary!")
Else
	GUICtrlSetData($Tar_AchPos,"No!")
;~ 	ToolTip2("Hustle Necessary!")
;~ 	$bIsHusNece=True
EndIf
;~ Return $bIsHusNece
Endfunc

Func Config_ActSettings()
	Local $TS1=$GS1_TarChk
	Local $TS2=$GS2_TarChk
	Local $TS3=$GS3_TarChk
	Global $iRnd
If $GChk_SRand=1 Then
	Global $iRnd=Random(1,3,1)
Switch $iRnd
	Case 1
		$GS1_TarChk=1
	Case 2
		$GS2_TarChk=1
	Case 3
		$GS3_TarChk=1
EndSwitch
EndIf

If $GS1_TarChk=1 Then
	Global $TarToday= $GS1_TarToday
	Global $TarHours=$GS1_TarHours
	Global $TarChk=$GS1_TarChk

	Global $HusLim=$GS1_HusLim
	Global $HusBef= $GS1_HusBef
	Global $HusThres=$GS1_HusThres
	Global $HusChk=$GS1_HusChk

	Global $RandTar= $GS1_RandTar
	Global $RandHus=$GS1_RandHus
	Global $RandChk=$GS1_RandChk
EndIf

If $GS2_TarChk=1 Then
	Global $TarToday= $GS2_TarToday
	Global $TarHours=$GS2_TarHours
	Global $TarChk=$GS2_TarChk

	Global $HusLim=$GS2_HusLim
	Global $HusBef= $GS2_HusBef
	Global $HusThres=$GS2_HusThres
	Global $HusChk=$GS2_HusChk

	Global $RandTar= $GS2_RandTar
	Global $RandHus=$GS2_RandHus
	Global $RandChk=$GS2_RandChk
EndIf

If $GS3_TarChk=1 Then
	Global $TarToday= $GS3_TarToday
	Global $TarHours=$GS3_TarHours
	Global $TarChk=$GS3_TarChk

	Global $HusLim=$GS3_HusLim
	Global $HusBef= $GS3_HusBef
	Global $HusThres=$GS3_HusThres
	Global $HusChk=$GS3_HusChk

	Global $RandTar= $GS3_RandTar
	Global $RandHus=$GS3_RandHus
	Global $RandChk=$GS3_RandChk
EndIf
$GS1_TarChk=$TS1
$GS2_TarChk=$TS2
$GS3_TarChk=$TS3
ToolTip2("Choosing Scheme "&$iRnd)
ToolTip2("$TarToday : "&$TarToday)
ToolTip2("$TarHours : "&$TarHours)
ToolTip2("$TarChk : "&$TarChk)

ToolTip2("$HusLim 	: "&$HusLim)
ToolTip2("$HusBef 	: "&$HusBef)
ToolTip2("$HusThres : "&$HusThres)
ToolTip2("$HusChk : "&$HusChk)

ToolTip2("$RandTar	:  "&$RandTar)
ToolTip2("$RandHus	:  "&$RandHus)
ToolTip2("$RandChk	:  "&$RandChk)
Randomization_Chk($RandTar,$RandHus,$RandChk)
GUICtrlSetData($Rand_Tar,$TarToday)
GUICtrlSetData($Rand_Hus,$HusLim)
GUICtrlSetData($Rand_Setting,$iRnd)

EndFunc
	Func Randomization_Chk($RandTar,$RandHus,$RandChk)
If $RandChk=1 Then
	ToolTip2("Randomization Checked!")
	$TarToday=Random($TarToday-$RandTar,$TarToday+$RandTar,1)
	$HusLim=Random($HusLim-$RandHus,$HusLim+$RandHus,1)
	ToolTip2("Values Randomized as: ")
	ToolTip2("$TarToday : "&$TarToday)
	ToolTip2("$HusLim 	: "&$HusLim)
EndIf
EndFunc

Func CurrentProgress($iProgress)
	GUICtrlSetData($PrgBar1,$iProgress)
EndFunc
	Func _IsChecked($idControlID)
	Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc

Func AutoStartCheck($ChckBoxData)
If $ChckBoxData=1 Then
	ToolTip2("Auto Start is Enabled. ")
	ToolTip2("Auto Starting Brain...")
	ToolTip2("")
	Brain()
EndIf
EndFunc

;Control Functions
Func TogglePause()
	ToolTip2("Script Paused!")
	$Paused = NOT $Paused
    While $Paused
;~ 	    ToolTip('',0,0,"Script Paused",1)
	    ToolTip('',0,0,"Script Paused",1)
		sleep(2000)
    WEnd
    ToolTip("")
EndFunc
	Func Terminate()
ToolTip("")
ToolTip2("GUI Successfully Loaded!")
GUI_Loop()
EndFunc
		Func CloseChrome()
			Send("{CTRLDOWN}")
Send("{CTRLUP}")
Sleep(250)
Send("{SHIFTDOWN}")
Send("{SHIFTUP}")
Sleep(250)
Send("{ALTDOWN}")
Send("{ALTUP}")
WinActivate("Google Chrome","")
Sleep(1000)
Send("{CTRLDOWN}")
Send("{SHIFTDOWN}")
Send("q")
Send("{CTRLUP}")
Send("{SHIFTUP}")
WinClose("Google Chrome")
;~ ToolTip("Restarting Chrome. Reason:	"&$sReason,0,0)
ToolTip2("Exiting Chrome...")
ProcessClose("Chrome.exe")
ToolTip2("Chrome Killed!")

		EndFunc

;Working Functions
Func Brain()
	GUICtrlSetData($Runtimefrm,Calc_Runtime(1))
	WinMove("Video Viewing Automator","",944, 0)

	ToolTip2("Initialised...")
	ResetCounters()
	CheckDowntime()
	NavigateToWebsite()
	WinWait("videoz","",60)
	CheckDowntime()
	Login()
	While $KeepWatching=1
		GUICtrlSetData($Runtimefrm,Calc_Runtime(1))
		Push_AllInfo($GPsh_AftCyc,$GPsh_Tk1,$GPsh_Tk2,$GPsh_Tk3,$GPsh_Tk4)
		$iWriteTotal=Get_Earnings($StoredViews)
		GUICtrlSetData($Eco_Total,$iWriteTotal)

		Local $iTemp_SRA=Calc_Runtime(0)
		$iTemp_SRA=$iTemp_SRA/$SuccessfulViews
		$iTemp_SRA=Sec2Time($iTemp_SRA)
		Local $iTemp_SRA1=String($iTemp_SRA)
		$iTemp_SRA1=StringTrimLeft($iTemp_SRA1,3)
		ToolTip2("S.Avg :"&$iTemp_SRA1)
		GUICtrlSetData($S_Avg,$iTemp_SRA1)
		ResetCounters()
		Runtime_Start()
		ToolTip2(" Successful Views / Attempted Views = "&$SuccessfulViews&" / "&$AttemptedViews)  ;add this at the beginning of brain
		SetGUIValues()
		MoveWindow()
		CheckSuccess()

		$Brn_Ctr=$Brn_Ctr+1
		Local $Brn_Ctr_alt = Mod ( $Brn_Ctr, 5 )
		If $Brn_Ctr_alt=0 Then
			Check_TargetAchieved()
;~ 			WriteToCSV()
		EndIf

		Runtime_Display()
		ResetCounters()
	WEnd
EndFunc

Func NavigateToWebsite();Reached login page
;~ ToolTip("Closing Previous Instances of Chrome...",0,0,"")
ToolTip2("Closing Previous Instances of Chrome...")
WinActivate("Google Chrome")
Send("{CTRLDOWN}")
Send("{SHIFTDOWN}")
Send("q")
Send("{CTRLUP}")
Send("{SHIFTUP}")
;~ ToolTip("Quiting Chrome as Recommended",0,0,"")
ToolTip2("Quiting Chrome as Recommended")
;~ ToolTip("Forcefully Closing Chrome",0,0)
ToolTip2("Forcefully Closing Chrome")
ProcessClose("Chrome.exe")
;~ ToolTip("Forcefully Closing Chrome #2",0,0)
ToolTip2("Forcefully Closing Chrome #2")
ProcessClose("Chrome.exe")
;~ ToolTip("Initialising Chrome...",0,0,"")
ToolTip2("Initialising Chrome...")
ShellExecute("Chrome.exe","--incognito http://videoz.bposervice.co.in/Default.aspx")
WinWait("Google")
;~ ToolTip("Resizing and Moving Chrome",0,0,"")
ToolTip2("Resizing and Moving Chrome")
WinMove("Google","",0,0,944, 680)
MouseMove(0,0,0)
Sleep(3000)
WinWait("videoz","",30)
CheckSiteLoad_videoz()
EndFunc
		Func CheckDowntime()
			#cs
		$itTimes=$itTimes+1
		ToolTip2("Pinging...")
		$ping = Ping("www.google.com")
		If $ping < $G_Ping  Then
			$iPingCtr2=0
		Else
		If $iPingCtr2=0 Then
			ToolTip2($itTimes&"Internet Down! Ping:"&$ping)
		EndIf
		Sleep(1000)

		$iPingCtr2=$iPingCtr2+1
		$iPingCtr=$iPingCtr+2
		$iPingCtr4=$iPingCtr3+$iPingCtr
		$iPingCtr5=Sec2Time($iPingCtr4)
		GUICtrlSetData($dwntime,$iPingCtr5)
		CheckDowntime()

		EndIf

					If $iPingCtr2=120 Then
					ToolTip2("Internet Down! Trying to Restart to Recover")
					Restart("Internet Down! Restart Counter (45) Reached.")
;~ 					Restart()
			EndIf
			#ce
		EndFunc

Func Login();login after reaching Website
;~ ToolTip("Initialising Logging In Sequence..",0,0)
ToolTip2("Initialising Logging In Sequence..")
CheckDowntime()

#cs
Send("{TAB}")
Sleep(250)
Send("{TAB}")
Sleep(250)
Send("{Del}")
Sleep(1000)
#ce
ControlClick2("videoz","","","left",2,$LoginTextField[0],$LoginTextField[1]) ;clicking Login field
;~ ControlClick2("videoz","","","left",2,1,23) ;clicking Login field
ToolTip2("LoginID : "&$GLoginID)
Send($GLoginID)
Sleep(500)
Send("{TAB}")
Sleep(250)
Send("{Del}")
Sleep(500)
ToolTip2("Password : "&$GPassword)
Send($GPassword)
Sleep(500)
CheckDowntime()
Send("{TAB}")
Send("{TAB}")
Send("{ENTER}")
CheckPassword()
EndFunc
	Func CheckPassword()
CheckDowntime()
Sleep(10000)
WinActivate("Home")
If WinActivate("Home")=True Then
;~ 	ToolTip("Credentials Probably Correct, No errors returned. Login Successful",0,0)
	ToolTip2("Login Successful!")
Else
	WinActivate("videoz.bposervice.co.in/session.aspx")
	If  WinActivate("videoz.bposervice.co.in/session.aspx")=True Then
;~ 	ToolTip("Multiple Logins Detected!",0,0)
	ToolTip2("Multiple Logins Detected!")
	CheckClearLogin()
	Else
	CheckDowntime()
	Restart("Error while Logging in.")
;~ Restart()
	EndIf
	EndIf
EndFunc
		Func CheckClearLogin()
			CheckDowntime()
;~ 			ToolTip("'Warning' text Detected! Clicking Clear Logins and Retrying...",0,0)
			ToolTip2("'Warning' text Detected! Clicking Clear Logins and Retrying...")
			ControlClick2("videoz","","","left",1,$ClearLoginBtn[0],$ClearLoginBtn[1]) ;clicing Clear Login
;~ 			ToolTip("Retrying Please Wait...",0,0)
			ToolTip2("Retrying Please Wait...")
			CheckDowntime()
			WinWait("videoz","",20)
			WinActivate("videoz")
			If WinActivate("videoz")=False Then
				Restart("Error while Logging in.")
;~ 				Restart()
			EndIf
			Sleep(4000)
			CheckSiteLoad_videoz()
			Login()
			EndFunc

Func MoveWindow()
;Only on first time initialisation
CheckDowntime()
;~ WinMove("Home","",0,0,328, 553) ;change size
WinActivate("Click")
If WinActivate("Click")=False Then
CloseAllOtherTabs("Home",1)
;~ ToolTip("Clicking Open Workspace...",0,0)
ToolTip2("Clicking Open Workspace...")
CheckDowntime()
Sleep(750)
ControlClick2("Home","","","left",1,$OpenWorkspaceBtn[0],$OpenWorkspaceBtn[1]) ;Click Open Workspace / Popup change
Sleep(500)
;~ CloseAllOtherTabs("Click",2,1)
;~ WinActivate("Click")
;~ ControlClick2("Home","","","left",1,98, 329) ;Click Open Workspace / Popup change
CheckSiteLoad_Click()
;~ WinActivate("Click ")
EndIf
Switch $iLoadOther
	Case 1
		ToolTip2("$iLoadOther=0, Loading Other Videos.")
		Send("{TAB 2}");click load other videos
		Send("{ENTER}")
		$iLoadOther=0
EndSwitch

ClickView()
EndFunc
	Func MoveWindow_LoadOther()
		;Only on first time initialisation
		CheckDowntime()
		CloseAllOtherTabs("Home",1)
;~ 		WinMove("Home","",0,0,328, 553) ;change
;~ 		WinActivate("Home")
		CheckDowntime()
;~ 		ToolTip("Clicking Open Workspace...",0,0)
		ToolTip2("Clicking Open Workspace...")
		ControlClick2("Home","","","left",1,331, 338) ;Click Open Workspace / Popup change
;~ 		ControlClick2("Home","","","left",1,98, 329) ;Click Open Workspace / Popup change
		Sleep(500)
		;Resize and Move PopUp
		CheckSiteLoad_Click()

		WinMove("Click ","",0, 0,944, 680) ;change
		WinActivate("Click ")
		Sleep(500)

;~ 		ToolTip("Clicking Load Other Videos",0,0)
		ToolTip2("Clicking Load Other Videos")
		Send("{TAB 2}");click load other videos
		Send("{ENTER}")
		$iLoadOther=0
		ClickView()
	EndFunc

		Func CheckSiteLoad_videoz()
ToolTip2("Checking 'Videoz' Site Load called...")
CheckDowntime()
If WinActivate("videoz")=True Then
	Sleep(6000)
	Send("{TAB}")
	Sleep(250)
	Send("{ENTER}")
	Sleep(500)
	$CheckSiteLoad_Var1 = PixelGetColor(170, 111)
	If($CheckSiteLoad_Var1=$CheckSiteLoad_Var2) Then
		$SiteLoad_Counter=1
		ToolTip2("Site Successfully Loaded!")
;~ 		ToolTip("Site Successfully Loaded!",0,0)
	Else
;~ 		ToolTip("Site Not Loaded!",0,0)
		ToolTip2("Site Not Loaded!")
		$SiteLoad_Counter=$SiteLoad_Counter+1
		If $SiteLoad_Counter=25 Then
			$SiteLoad_Counter=1
			Restart("videoz.bposervice.co.in - Failed to Load Counter (25) Reached.")
;~ Restart()
		EndIf
		CheckSiteLoad_videoz()
	EndIf
EndIf
EndFunc
			Func CheckSiteLoad_Click()
ToolTip2("Checking 'Click' Site Load called..."&$CheckSiteLoad_Click)
WinActivate("Click")
CheckDowntime()
If WinActivate("Click ")=False Then
	ToolTip2("Click2Earn Site not Loaded!")
	$CheckSiteLoad_Click=$CheckSiteLoad_Click+1
	If $CheckSiteLoad_Click=10 Then
		ClosePopUp()
		Return
	EndIf

	If $CheckSiteLoad_Click=15 Then
		$CheckSiteLoad_Click=0
		Restart("Click2Earn (Popup) Failed to Load Counter (30) Reached.")
		Return
	EndIf
	CheckSiteLoad_Click()
ElseIf WinActivate("Click ")=True Then
	$CheckSiteLoad_Click=0
EndIf
EndFunc
				Func CloseAllOtherTabs($sWindowName,$iTabNumber,$iChoice=0,$iAllowCycle=0)
CheckDowntime()
ToolTip2("CloseAllOtherTabs Initialised. Called from : "&$sWindowName)
WinActivate("Google Chrome")
WinActivate("Click ")
WinActivate("videoz")
Send("{CTRLDOWN}")
Send($iTabNumber)
Send("{CTRLUP}")
ToolTip2("Switching to Tab "&$iTabNumber)
Send("{CTRLDOWN}")
Send($iTabNumber)
Send("{CTRLUP}")
$currTab = WinGetTitle("[ACTIVE]")
while StringInStr($currTab, $sWindowName) = 0 And $CloseAllOtherTabs_Counter<26 And $iAllowCycle=0
Send('^{TAB}')
ToolTip2("Pressing Ctrl+Tab. "&$CloseAllOtherTabs_Counter)
Sleep(500)
WinActivate("Google Chrome")
$currTab = WinGetTitle("[ACTIVE]")
$CloseAllOtherTabs_Counter=$CloseAllOtherTabs_Counter+1
If $CloseAllOtherTabs_Counter=25 Then
	ExitLoop
	$CloseAllOtherTabs_Counter=0
	Restart("["&$CloseAllOtherTabs_Counter&"]Too many Tabs Open Counter (25) Reached.")
;~ 	Restart()

EndIf
WEnd
Switch $iChoice
	Case 0
		ToolTip2("Closing all the tabs to the right.")
		Send("{ALTdown}") ;use chrome extension too close all the tabs to the right
		Send("{SHIFTdown}")
		Send("r")
		Send("{ALTup}")
		Send("{SHIFTup}")
	Case 1
		ToolTip2("Not any closing tabs.")
EndSwitch

				EndFunc
Func ClickView()
CheckDowntime()
Sleep(1000)
CheckSiteLoad_Click()
WinWait("Click ","",15)
;~ WinMove("Click ","",0, 0,944, 680)
;~ ToolTip("Clicking View...",0,0)
ToolTip2("Clicking View...")
Sleep(250)
Send("{TAB 3}");click frm move_ loadother
Send("{ENTER}")
CheckVideoViewerLoaded()
EndFunc
	Func CheckVideoViewerLoaded($iChoice=0)
	$CVVL_Ctr=0
	If $CVVL_Ctr=0 Then
	CheckDowntime()
;~ 	WinActivate("Click")
	Local $hP_ColorReq=0xD6C900						;Required Coords
	Local $hP_ColorTest = PixelGetColor(246, 122)	;Coordinate of Orange Video Viewer Region
	If $hP_ColorTest = $hP_ColorReq Then
		$CVVL_Ctr=1
		$CheckViewer_Counter=0
;~ 		ToolTip("VideoViewer Loaded! ",0,0)
		ToolTip2("VideoViewer Loaded!")
		Switch $iChoice
			Case 0
			CheckYouTubeLoaded()
			Case 1
			ToolTip2("VideoViewer WP is On...")
			EndSwitch
	Else
		$CVVL_Ctr=0
;~ 		ToolTip("VideoViewer Not Loaded! Retrying in 3 seconds",0,0)
		ToolTip2("VideoViewer Not Loaded! Retrying in 3 seconds")
;~ 		$iStillWatch=1
		$VideoViewer_LoadErr=$VideoViewer_LoadErr=1
		$CheckViewer_Counter=$CheckViewer_Counter+1
;~ 		ControlClick2("Click","","","left",1,469, 442) ;click play
		Sleep(1000)

		If $CheckViewer_Counter=3 Then
		ControlClick2("Click","","","left",1,472, 470) ;click Closing
;~ 		Send("{F5}")
		Sleep(2000)
		CheckSiteLoad_Click()
		WinWait("Click ","",15)
		ToolTip2("Clicking View...")
		Sleep(250)
		Send("{TAB 3}");click frm move_ loadother
		Send("{ENTER}")
		Sleep(500)
		EndIf


		If $CheckViewer_Counter=5 Then
;~ 		$CheckViewer_Counter=0
		Switch $iChoice
			Case 1
			$iWatchRedirect=1
			$cCounter=0
			ToolTIp2("$iWatchRedirect=1 & $cCounter=0")
			ClosePopUp()
			Return
			Case 0
				ClosePopUp()
		EndSwitch
		Return
		EndIf

		If $CheckViewer_Counter=25 Then
		$CheckViewer_Counter=0
		$iWatchRedirect=1
		$cCounter=0
		Restart("Video Viewer Not Loaded!")
		Return
		EndIf

		CheckVideoViewerLoaded()
	EndIf
	EndIf
	$CheckViewer_Counter=0
EndFunc

Func CheckYouTubeLoaded()
	Sleep(250)
;Wait till video is loading
CheckDowntime()
#cs
$var2   = PixelGetColor(769, 230)
$var2_2 = PixelGetColor(183, 197)
$var2_3 = PixelGetColor(464, 421)
$var2_3 = PixelGetColor(558, 224)
$var2_4 = PixelGetColor(377, 271)
#ce
;~ If Not $var2=$check_var Or Not $var2_2=$check_var Or Not $var2_3=$check_var Or Not $var2_4=$check_var Then
WinActivate("Click ")
Opt("PixelCoordMode", 0)
$var2   = PixelGetColor(484, 546);black
$var2_2 = PixelGetColor(488, 147);black
$var2_3 = PixelGetColor(482, 346);0xFFFFFF
ToolTip2("Color of $var2_3:"&$var2_3&" "&$check_var)
$var2_4 = PixelGetColor(377, 271)
;~ If $var2=$check_var Or $var2_2=$check_var Or $var2_3=0xFFFFFF Then
If $var2_3="0xFFFFFF" Or $var2=$check_var Or $var2_3=$check_var Or $var2_3=Hex("0xFFFFFF") And Not $var2_3=0 Then
	$var2_3=$var2=$var2_2=""
	CheckDeletedVideo()
	ToolTip2("Video Loaded!")
Else
	ToolTip2("Video Loading...")
	CheckYouTubeLoaded_Counter()
	CheckYouTubeLoaded()
	EndIf
EndFunc
	Func CheckYouTubeLoaded_Counter()
			CheckDowntime()
;~ 			ToolTip("Checking Video Load Counter - "&$CheckYouTubeLoaded_Counter,0,0)
			ToolTip2("Checking Video Load Counter - "&$CheckYouTubeLoaded_Counter)
			$CheckYouTubeLoaded_Counter=$CheckYouTubeLoaded_Counter+1
			Local $cCounter_alt1 = Mod ( $CheckYouTubeLoaded_Counter, 3 )
			If $cCounter_alt1 = 0 Then
				CheckDowntime()
			EndIf
;~ 			GUICtrlSetData($videoloaderr,$VideoLoading_Errors)
			If $CheckYouTubeLoaded_Counter>=$GL_Lim Then
				$VideoLoading_Errors=$VideoLoading_Errors+1
				$CheckYouTubeLoaded_Counter=0
				ClosePopUp()
				Return
			EndIf
EndFunc
Func ClosePopUp()
ToolTip2("Closing PopUp!")
;This uses a chrome extension  named close tab which adds a close tab button as a extension and this will click this button, so only this and this button needs to be on the bookmark bar
WinActivate("Google")
ControlClick2("Click ","","","left",1,888, 66)
;~ ToolTip("Closing PopUp!",0,0)
CheckDowntime()
MoveWindow_LoadOther()
Return
EndFunc

Func CheckDeletedVideo($iChoice=0) ;Choice do you want to redirect to watchfor30 or just keep playing when this function will be called from Closepopup many a times it will already be in the watchloop
	WinActivate("Click ")
	$CheckYouTubeLoaded_Counter=0
	Local $hP_ColorReq=0xCBCBCB, $hP_ColorTest = PixelGetColor(697, 392)		;Color and Coordinate of Gray Deleted Video Region
	Local $hP_ColorReq_2=0xDADADA, $hP_ColorTest_2 = PixelGetColor(448, 202)	;Color and Coordinate of Gray Deleted Video Region 2
	If( $hP_ColorTest = $hP_ColorReq Or $hP_ColorTest_2 = $hP_ColorReq_2 ) Then
		ToolTip2("Deleted / Private Video Detected!")
		$Private_V_Ctr=$Private_V_Ctr+1
		GUICtrlSetData($PrivVideoGUI,$Private_V_Ctr)
		ClosePopUp()
		Return
;~ 		ClickView()
	Else
		WinActivate("Click")
;~ 		ControlClick2("Click","","","left",1,458,317) ;click play
		MouseClick("left",458,317,1,0)
		MouseMove(0,0,0)
		Global $firsttime=0
;~ 		Switch $iChoice
		Switch $iWatchRedirect
			Case 0
			ToolTip2("$iWatchRedirect=0, Calling WatchFor30Seconds...")
			WatchFor30Seconds("CheckDeletedVideo")
		EndSwitch

	EndIf
	EndFunc
	Func WatchFor30Seconds($sCalledFrom="Default")
MouseMove(1,1,1)
;~ change
;~ ToolTip2("WatchFor30Seconds Called from :"&$sCalledFrom)
Global $ImageToReadPath = @ScriptDir & "\image.bmp"
Global $ResultTextPath = @ScriptDir & "\Result"
Global $OutPutPath = $ResultTextPath & ".txt"
Global $TesseractExePath = @ScriptDir & "\Tesseract.exe"
$AttemptedViews=$AttemptedViews+1
GUICtrlSetData($A_View,$AttemptedViews)
Global $cCounter=0,$CheckIfZero_Counter=0
FileDelete($OutPutPath)
FileDelete($ImageToReadPath)
$iStillWatch=0
While $iStillWatch=0
;~ While  $OutPutPath="56|" Or  $OutPutPath="56|" Or  $OutPutPath="57|" Or  $OutPutPath="58|" Or  $OutPutPath="59|"  Or  $OutPutPath="60|" Or  $OutPutPath="61|" Or  $OutPutPath="62|" Or  $OutPutPath="63|" Or  $OutPutPath="64|" Or  $OutPutPath="65|" Or  $OutPutPath="67|" Or  $OutPutPath="68|" Or  $OutPutPath="69|" Or  $OutPutPath=";55|" Or  $OutPutPath=";56|" Or  $OutPutPath=";57|" Or  $OutPutPath=";58|" Or  $OutPutPath=";59|"  Or  $OutPutPath=";60|" Or  $OutPutPath=";61|" Or  $OutPutPath=";62|" Or  $OutPutPath=";63|" Or  $OutPutPath=";64|" Or  $OutPutPath=";65|" Or  $OutPutPath=";67|" Or  $OutPutPath=";68|" Or  $OutPutPath=";69|" Or  $OutPutPath=";70|" Or  $OutPutPath=";71|" Or  $OutPutPath=";72|" Or  $OutPutPath=";73|" Or  $OutPutPath=";74|" Or  $OutPutPath=";75|" Or  $OutPutPath=";76|" Or  $cCounter=$GWatchCounterLim Or  $iStillWatch=1
;~ While Not $OutPutPath="56|" Or Not $OutPutPath="56|" Or Not $OutPutPath="57|" Or Not $OutPutPath="58|" Or Not $OutPutPath="59|"  Or Not $OutPutPath="60|" Or Not $OutPutPath="61|" Or Not $OutPutPath="62|" Or Not $OutPutPath="63|" Or Not $OutPutPath="64|" Or Not $OutPutPath="65|" Or Not $OutPutPath="67|" Or Not $OutPutPath="68|" Or Not $OutPutPath="69|" Or Not $OutPutPath=";55|" Or Not $OutPutPath=";56|" Or Not $OutPutPath=";57|" Or Not $OutPutPath=";58|" Or Not $OutPutPath=";59|"  Or Not $OutPutPath=";60|" Or Not $OutPutPath=";61|" Or Not $OutPutPath=";62|" Or Not $OutPutPath=";63|" Or Not $OutPutPath=";64|" Or Not $OutPutPath=";65|" Or Not $OutPutPath=";67|" Or Not $OutPutPath=";68|" Or Not $OutPutPath=";69|" Or Not $OutPutPath=";70|" Or Not $OutPutPath=";71|" Or Not $OutPutPath=";72|" Or Not $OutPutPath=";73|" Or Not $OutPutPath=";74|" Or Not $OutPutPath=";75|" Or Not $OutPutPath=";76|" Or Not $cCounter=$GWatchCounterLim Or Not $iStillWatch=1
;~ Until $OutPutPath="30|" Or $OutPutPath="31|" Or $OutPutPath="32|" Or $OutPutPath="33|" Or $OutPutPath="34|" Or $OutPutPath="35|" Or $OutPutPath="36|" Or $OutPutPath="37|" Or $OutPutPath="38|" Or $OutPutPath="39|" Or $OutPutPath="40|" Or $OutPutPath="41|"
;~ Until $OutPutPath="56|" Or $OutPutPath="56|" Or $OutPutPath="57|" Or $OutPutPath="58|" Or $OutPutPath="59|"  Or $OutPutPath="60|" Or $OutPutPath="61|" Or $OutPutPath="62|" Or $OutPutPath="63|" Or $OutPutPath="64|" Or $OutPutPath="65|" Or $OutPutPath="67|" Or $OutPutPath="68|" Or $OutPutPath="69|" Or $OutPutPath=";55|" Or $OutPutPath=";56|" Or $OutPutPath=";57|" Or $OutPutPath=";58|" Or $OutPutPath=";59|"  Or $OutPutPath=";60|" Or $OutPutPath=";61|" Or $OutPutPath=";62|" Or $OutPutPath=";63|" Or $OutPutPath=";64|" Or $OutPutPath=";65|" Or $OutPutPath=";67|" Or $OutPutPath=";68|" Or $OutPutPath=";69|" Or $OutPutPath=";70|" Or $OutPutPath=";71|" Or $OutPutPath=";72|" Or $OutPutPath=";73|" Or $OutPutPath=";74|" Or $OutPutPath=";75|" Or $OutPutPath=";76|" Or $cCounter=120
;~ Until $OutPutPath="56.|" Or $OutPutPath="56.|" Or $OutPutPath="57.|" Or $OutPutPath="58.|" Or $OutPutPath="59.|"  Or $OutPutPath="60.|" Or $OutPutPath="61.|" Or $OutPutPath="62.|" Or $OutPutPath="63.|" Or $OutPutPath="64.|" Or $OutPutPath="G5.|" Or $OutPutPath="G7.|" Or $OutPutPath="G8.|" Or $OutPutPath="69|" Or $OutPutPath=";55|" Or $OutPutPath=";56|" Or $OutPutPath=";57|" Or $OutPutPath=";58|" Or $OutPutPath=";59|"  Or $OutPutPath=";60|" Or $OutPutPath=";61|" Or $OutPutPath=";62|" Or $OutPutPath=";63|" Or $OutPutPath=";64|" Or $OutPutPath=";65|" Or $OutPutPath=";67|" Or $OutPutPath=";68|" Or $OutPutPath=";69|" Or $OutPutPath=";70|" Or $OutPutPath=";71|" Or $OutPutPath=";72|" Or $OutPutPath=";73|" Or $OutPutPath=";74|" Or $OutPutPath=";75|" Or $OutPutPath=";76|" Or $cCounter=120

If WinActivate("Click ")=True Then
;~ 	_ScreenCapture_Capture("image.bmp", 377, 569,402, 593) ;try to capture timing
	_ScreenCapture_Capture("image.bmp", $DisplayTimeUpperLeft[0],$DisplayTimeUpperLeft[1], $DisplayTimeLowerRight[0],$DisplayTimeLowerRight[1]) ;try to capture timing
	ShellExecuteWait($TesseractExePath, '"' & $ImageToReadPath & '" "' & $ResultTextPath & '"', "", "", @SW_HIDE)
	Global $OutPutPath1 = 0
	_FileReadToArray("Result.txt", $OutPutPath1, 0)
	$OutPutPath = _ArrayToString($OutPutPath1)
	ToolTip2("Ctr:"&$cCounter&" Lim:"&$GWatchCounterLim&" Time:"&$OutPutPath&" CIAP:"&$CIAP_Var2_Counter&" C.Lim:"&$GCIAP&" C.Ini:"&$CIAP_Var3)
	FileDelete($OutPutPath)
Else
	ToolTip2("Couldnt find the PopUp")
EndIf

CheckIfZero()
$cCounter_alt = Mod ( $cCounter, 3 )


If $OutPutPath="56|" Or  $OutPutPath="56|" Or  $OutPutPath="57|" Or  $OutPutPath="58|" Or  $OutPutPath="59|" Or  $OutPutPath="60|" Or  $OutPutPath="61|" Or  $OutPutPath="62|" Or  $OutPutPath="63|" Or  $OutPutPath="64|" Or  $OutPutPath="65|" Or  $OutPutPath="67|" Or  $OutPutPath="68|" Or  $OutPutPath="69|" Or  $OutPutPath=";55|" Or  $OutPutPath=";56|" Or  $OutPutPath=";57|" Or  $OutPutPath=";58|" Or  $OutPutPath=";59|"  Or  $OutPutPath=";60|" Or  $OutPutPath=";61|" Or  $OutPutPath=";62|" Or  $OutPutPath=";63|" Or  $OutPutPath=";64|" Or  $OutPutPath=";65|" Or  $OutPutPath=";67|" Or  $OutPutPath=";68|" Or  $OutPutPath=";69|" Or  $OutPutPath=";70|" Or  $OutPutPath=";71|" Or  $OutPutPath=";72|" Or  $OutPutPath=";73|" Or  $OutPutPath=";74|" Or  $OutPutPath=";75|" Or  $OutPutPath=";76|" Or  $OutPutPath="71|" Or  $OutPutPath="72|" Or  $OutPutPath="73|" Or  $OutPutPath="74|" Or  $OutPutPath="75|" Or  $OutPutPath="77|" Or  $OutPutPath="78|" Or  $OutPutPath="79|" Or  $OutPutPath="76|" Or $OutPutPath="81|" Or  $OutPutPath="82|" Or  $OutPutPath="83|" Or  $OutPutPath="84|" Or  $OutPutPath="85|" Or  $OutPutPath="87|" Or  $OutPutPath="88|" Or  $OutPutPath="89|" Or  $OutPutPath="86|" Or  $OutPutPath="70|" Or  $OutPutPath="80|" Or  $OutPutPath="90|" Or $OutPutPath="90|" Or  $OutPutPath="91|" Or  $OutPutPath="92|" Or  $OutPutPath="93|" Or  $OutPutPath="94|" Or  $OutPutPath="95|" Or  $OutPutPath="96|" Or  $OutPutPath="97|" Or  $OutPutPath="98|" Or  $OutPutPath="99|" Then
$iStillWatch=1
EndIf

If $cCounter=$GWatchCounterLim Then
	$iStillWatch=1
	$iLoadOther=1
;~ 	ClosePopUp()
	Return
EndIf
$cCounter=$cCounter+1


If $cCounter_alt = 0  And $iStillWatch=0 Then
	CheckVideoViewerLoaded(1)
	CheckIfShortVideo()
	CheckIfAccidentlyPaused()
	CheckDowntime()
EndIf

WEnd
ToolTip2("Watch Completed!")
$iWatchRedirect=0
ToolTip2("Clicking Close Video Viewer.")
ControlClick2("Click ","","","left",1,470, 662) ;change to tab
;~ CheckSuccess()

EndFunc
Func CheckIfZero()
	If $OutPutPath="0|" Or  $OutPutPath=";0|" Or  $OutPutPath=" 0 " Or  $OutPutPath="0|" Or  $OutPutPath=";0" Or  $OutPutPath=" " Or  $OutPutPath="0 " Or  $OutPutPath=" 0" Or $OutPutPath= ";0" Or $OutPutPath="O|" Or $OutPutPath="o|" Then
;~ 		ToolTip("Zero Detected! Counter- "&$CheckIfZero_Counter,0,0)
		ToolTip2("Zero Detected! Counter- "&$CheckIfZero_Counter)
		$CheckIfZero_Counter=$CheckIfZero_Counter+1
		Sleep(750)
	Else
		$CheckIfZero_Counter=0
	EndIf

	If $CheckIfZero_Counter=5 Then
;~ 	$CheckIfZero_Counter=0
		ToolTip2("CheckIfZero() Reached 5, Clicking Play.")
		MouseClick("left",333, 216,1,0)
		MouseMove(0,0,0)
;~ 	$iStillWatch=1
	Return
	EndIf

	If $CheckIfZero_Counter>=$GZ_Lim Then
		$ChkZeroCtr=$ChkZeroCtr+1
		GUICtrlSetData($ChkZeroErrGUI,$ChkZeroCtr)
		$CheckIfZero_Counter=0
		$iLoadOther=1
;~ 		ControlClick2("Click ","","","left",1,470, 662) ;close viewer
;~ 		$iStillWatch=1
		$iWatchRedirect=1
		$cCounter=0
		ToolTIp2("$iWatchRedirect=1 & $cCounter=0")
		ClosePopUp()
		Return
	EndIf
EndFunc
	Func CheckIfAccidentlyPaused()
If $CIAP_Var2_Counter=0 Then
	$CIAP_Var3=$OutPutPath
;~ 	ToolTip("C-I-A-P Variables Initialised",0,0)
	ToolTip2("C-I-A-P Variables Initialised	: "&$CIAP_Var3)
EndIf
$CIAP_Var2_Counter=$CIAP_Var2_Counter+1
If $CIAP_Var2_Counter=$GCIAP Then
	$CIAP_Var2_Counter=0
	$CIAP_Var1=$OutPutPath
	ToolTip2("C-I-A-P Limit Reached Checking for Pauses")
;~ 	ToolTip("C-I-A-P Limit Reached Checking for Pauses",0,0)

	If $CIAP_Var1=$CIAP_Var3 Then
		$CIAP_FuncCounter=$CIAP_FuncCounter+1
		$CIAP_Error=$CIAP_Error+1
		GUICtrlSetData($VAPE,$CIAP_Error)
;~ 		ToolTip("Video Paused! Clicking Play",0,0)
		WinActivate("Click ")
		ToolTip2("Video Paused! Clicking Play : "&$CIAP_Var1&"="&$CIAP_Var3)
;~ 		MouseClick("left",333, 216,1,0)
		Send("{SPACE}")
		MouseMove(0,0,0)
		$CIAP_Var2_Counter=0
;~ 		ToolTip("C-I-A-P Counter - "&$CIAP_FuncCounter,0,0)
;~ 		ToolTip2("C-I-A-P Counter - "&$CIAP_FuncCounter)
;~ 		If $CIAP_FuncCounter=5 Then
;~ 			$CIAP_FuncCounter=0
;~ 			Restart("CIAP Counter (5) Reached.")
;~ 			Return
;~ 		EndIf
	Else
		$CIAP_FuncCounter=0
		$CIAP_Var3=""
		$CIAP_Var1=""
	EndIf
EndIf
;~ Return
EndFunc
		Func CheckIfShortVideo()
Local $CSC_V1 = PixelGetColor(784, 142)
Local $CSC_C1 = 0xCBCBCB
;~ ToolTip2("Checking for Short Video and Share Button...")
Local $CSC_V2 = PixelGetColor(783, 156)
Local $CSC_C2 = 0xCBCBCB

If $CSC_V1 = $CSC_C1 Or $CSC_V2 = $CSC_C2 Then
	ToolTip2("Short Video Detected!, Share icon found!")
	$iCSV_ctr=$iCSV_ctr+1
	GUICtrlSetData($ShrtVideo,$iCSV_ctr)
	WinActivate("Click ")
	ToolTip2("$iWatchRedirect=1")
	$iWatchRedirect=1
	$iLoadOther=1
	$cCounter=0
;~ 	$iStillWatch=1
	ToolTIp2("$iWatchRedirect=1 & $cCounter=0")
	ClosePopUp()
Else
;~ 	ToolTip2("ShortVideo Not Detected.")
EndIf
EndFunc

Func CheckSuccess()
;~ 	ClipPut("")
	CheckDowntime()
;~ 	ToolTip("Checking for Successful Watch!",0,0)
	ToolTip2("Checking for Successful Watch!")
	#cs
	Sleep(2000)
	WinActivate("Click")
	MouseClick("left",31, 153,2,0)
	Send ("{CTRLDOWN}")
	Send("c")
	Send ("{CTRLUP}")
	Sleep(500)
	Global $CheckSuccess = ClipGet()					;Add to reset counters
	MouseClick("left",34, 641,1,0)
	MouseMove(0,0,0)
	#ce
;~ 	ToolTip2("Checking Success Text: "&$CheckSuccess)

	WinActivate("Click ")
	Sleep(2000)
;~ 	MsgBox($MB_SYSTEMMODAL, "", "X and Y are: " & $msg[0] & "," & $msg[1])

	Local $msg = PixelSearch(13, 146,74, 172, 0x008000,25)
	If Not @error Then
;~ 	If $CheckSuccess="Your " Or $CheckSuccess="Your " Then							;Change to Read the Success Text
;~ 		ToolTip("Video has been watched Successfully and it is noted by the server. Navigating to the next video ! ",0,0)
		ToolTip2("Video Watched Successfully!")
		$SuccessfulViews=$SuccessfulViews+1
		Global $RTime_Secs=Calc_Runtime(0)
		Global $Hours_Els=TimeElap_Hour($RTime_Secs)
		ViewsThisHr("add")
		GUICtrlSetData($Tar_Today_Done,$SuccessfulViews)
		GUICtrlSetData($S_View,$SuccessfulViews)
		GUICtrlSetData($S_Rate,$SuccessfulViews/$AttemptedViews*100)
		WriteViews("success")
	Else
		ToolTip2("'Error' Video wasn't watched Successfully.")
;~ 		TakeScreenshot_NotSuccess()
		If WinActivate("Session") Then
;~ 		ToolTip("'Session Expired!' text found! Trying to watch the next video!",0,0)
		ToolTip2("'Session Expired!' text found!")
		$Session_Expired_Counter=$Session_Expired_Counter+1
		GUICtrlSetData($Session_Expired_Counter_GUI,$Session_Expired_Counter)
		Restart("Session Expired Text found!")
		EndIf
	EndIf
EndFunc
	Func Check_TargetAchieved()
	ToolTip2("Checking if Target is Achieved ")
	If $TarToday<Int($StoredViews) Then
		ToolTip2("("&$TarToday&"<"&$StoredViews&")")
		ToolTip2("Target is Achieved!")
		Push_AllInfo($GPsh_AftCyc,$GPsh_Tk1,$GPsh_Tk2,$GPsh_Tk3,$GPsh_Tk4,"Target Achieved! @ "&@HOUR&":"& @MIN&":"&@SEC,"Target Achieved on System: "&@ComputerName)
		ToolTip2("Checking if Auto-Shutdown is Checked!")
		If $GChk_Shtdwn=1 Then
		Push_AllInfo($GPsh_AftCyc,$GPsh_Tk1,$GPsh_Tk2,$GPsh_Tk3,$GPsh_Tk4,"System Hibernated! @ "&@HOUR&":"& @MIN&":"&@SEC,"Hibernating System: "&@ComputerName)
		ToolTip2("Hibernating System...")
		Shutdown(64)
		CloseChrome()
		GUI_Loop()
		Else
		ToolTip2("Auto-Shutdown is not Checked! Just Stopping the Bot.")
		WinClose("Google Chrome")
		CloseChrome()
		GUI_Loop()
		EndIf
	Else
		ToolTip2("("&$TarToday&">"&$StoredViews&") Target Not Achieved!")

	EndIf
	EndFunc
		Func Read_Text($x1,$y1,$x2,$y2)
Local $ImageToReadPath = @ScriptDir & "\image.bmp"
Local $ResultTextPath = @ScriptDir & "\Result"
Local $OutPutPath = $ResultTextPath & ".txt"
Local $TesseractExePath = @ScriptDir & "\Tesseract.exe"
Local $WinPos=WinGetPos("MEmu ")
 $x1=$WinPos[0]+$x1
 $y1=$WinPos[1]+$y1
 $x2=$WinPos[0]+$x2
 $y2=$WinPos[1]+$y2
_ScreenCapture_Capture("image.bmp",$x1,$y1,$x2,$y2)
$Read_C=@MON&@MDAY&@HOUR&@MIN&@SEC
_ScreenCapture_Capture("ReadText\image"&$Read_C&".bmp",$x1,$y1,$x2,$y2)
ShellExecuteWait($TesseractExePath, '"' & $ImageToReadPath & '" "' & $ResultTextPath & '"', "", "", @SW_HIDE)
If @error Then
	Exit MsgBox(0, "Error", @error)
EndIf
Local $OutPutPath1 = 0
_FileReadToArray("Result.txt", $OutPutPath1, 0)
Local $OutPutPath = _ArrayToString($OutPutPath1)
$OutPutPath1=StringTrimRight ( $OutPutPath, 1 )
ToolTip($OutPutPath1,0,0)
ToolTip2($OutPutPath1)
;~ MsgBox("","",$OutPutPath1)
;~ ToolTip2($OutPutPath)
FileDelete($OutPutPath)
Return $OutPutPath1
$OutPutPath="0"
EndFunc
			Func TakeScreenshot_NotSuccess()
    ; Capture full screen
	WinActivate("Video Viewing Automator")
	WinSetState("Video Viewing Automator", "", @SW_HIDE)
	Sleep(1000)
	DirCreate("Screenshots_Fail")
	DirCreate("Screenshots_Fail\"&@MDAY &"_"& @MON &"_"& @YEAR  )

	ToolTip("")
;~ 	WinMove("Home","",0,0,887, 740,0)
;~ 	WinMove("Click","",0, 141,916, 566,0)
	WinActivate("Home")
	WinActivate("Click ")

	ToolTip("")
	$FName = StringFormat("\A%2s%02d%02d_%02d%02d%02d.png", StringRight(@YEAR, 2), @MON, @MDAY, @HOUR, @MIN, @SEC)
	_ScreenCapture_Capture("Screenshots_Fail\"&@MDAY &"_"& @MON &"_"& @YEAR&"\"&$Fname)
	WinSetState("Video Viewing Automator", "", @SW_SHOW)

	WinActivate("Video Viewing Automator")
	DirCreate("Screenshots_Fail")
	DirCreate("Screenshots_Fail\"&@MDAY &"_"& @MON &"_"& @YEAR&"\"  &"WithSoft_"&@MDAY &"_"& @MON &"_"& @YEAR)
	ToolTip("")
	$FName = StringFormat("\A%2s%02d%02d_%02d%02d%02d.png", StringRight(@YEAR, 2), @MON, @MDAY, @HOUR, @MIN, @SEC)
	_ScreenCapture_Capture("Screenshots_Fail\"&@MDAY &"_"& @MON &"_"& @YEAR&"\"  &"WithSoft_"&@MDAY &"_"& @MON &"_"& @YEAR&"\"&$Fname)
	EndFunc

Func ToolTip2($Log_Var)
$Log_Counter=$Log_Counter+1
Global $TimeStamp_Log=String("("&@HOUR&":"& @MIN&":"&@SEC&") ")
Global $Log_Write=String($TimeStamp_Log&$Log_Var&@CRLF)
ToolTip($Log_Var,0,0)
_GUICtrlEdit_AppendText($Log,$Log_Write)
_GUICtrlEdit_AppendText($Log2,$Log_Write)
DirCreate("Logs")
FileWrite("Logs\"&$FileName_Session&".txt",$Log_Write)
ConsoleWrite($Log_Write)
$Log_Var=""
If $Log_Counter=200 Then
	$Log_Counter=0
	GUICtrlSetData($Log,"")
	GUICtrlSetData($Log2,"")
EndIf
EndFunc

Func Restart($sReason)
;~ ToolTip("Restarting Brain. Reason :"& $sReason,0,0)
ToolTip2("Restarting Brain. Reason :"& $sReason)
CheckDowntime()
$SiteLoad_Counter=0
Send("{CTRLDOWN}")
Send("{CTRLUP}")
Sleep(250)
Send("{SHIFTDOWN}")
Send("{SHIFTUP}")
Sleep(250)
Send("{ALTDOWN}")
Send("{ALTUP}")
WinActivate("Google Chrome","")
Sleep(1000)
Send("{CTRLDOWN}")
Send("{SHIFTDOWN}")
Send("q")
Send("{CTRLUP}")
Send("{SHIFTUP}")
WinClose("Google Chrome")
;~ ToolTip("Restarting Chrome. Reason:	"&$sReason,0,0)
ToolTip2("Restarting Chrome. Reason: "&$sReason)
ProcessClose("Chrome.exe")
ToolTip2("Chrome Killed!")
$Restart_Counter=$Restart_Counter+1
GUICtrlSetData($Rsrt,$Restart_Counter)
CheckDowntime()
Brain()
EndFunc
	Func ResetCounters()
	$var2=""
	$var3=""
	$check_var=0x000000
	$check_var2=0x292623
	$Video_Loaded_Check=""
	$Video_Playing_Check=""
	$CIAP_FuncCounter=0
	$ChkBuff_Counter1=0
	$CheckYouTubeLoaded_Counter=0
	$CheckViewer_Counter=0
	$CheckSiteLoad_Click=0
	$iStillWatch=0
	$iWatchRedirect=0
	EndFunc

Func Runtime_Start()
Global $RunTime_Var = TimerInit() ; Begin the timer and store the handle in a variable.
$RunTime_Counter=$RunTime_Counter+1
EndFunc
	Func Runtime_Display()
	Global $Runtime_Var2 = TimerDiff($Runtime_Var) ; Find the difference in time from the previous call of TimerInit. The variable we stored the TimerInit handlem is passed as the "handle" to TimerDiff.
	$RunTime_Var3=$Runtime_Var2

	If $RunTime_Counter=1 Then
		$Runtime=Sec2Time($Runtime_Var3/1000)
		_GUICtrlEdit_AppendText($lstcycle,$Runtime&@CRLF)
	Else
		Runtime_Cycle()
		$Runtime_Raw=$Runtime_Raw+$Runtime_Var3
		$Runtime=Sec2Time($Runtime_Raw/1000)
	EndIf
;~ 		GUICtrlSetData($Runtimefrm,$RunTime)
		Local $Tempc=String($Runtime_Cycle)
		$Tempc=StringTrimLeft($Tempc,3)
		_GUICtrlEdit_AppendText($lstcycle,$Tempc&@CRLF)
		$LastCycle_Counter=$LastCycle_Counter+1
	If $LastCycle_Counter=50 Then
		$LastCycle_Counter=0
		GUICtrlSetData($lstcycle,"")
	EndIf
	EndFunc
			Func Runtime_Cycle()
			Global $Runtime_Cycle =Sec2Time($Runtime_Var3/1000)
			$Runtime_Cycle_Avg_Sum=$Runtime_Cycle_Avg_Sum+$Runtime_Var3
			$Runtime_Cycle_Avg_Counter=$Runtime_Cycle_Avg_Counter+1
			EndFunc
				Func Runtime_Cycle_Avg()
					$Runtime_Cycle_Avg=$Runtime_Cycle_Avg_Sum/$Runtime_Cycle_Avg_Counter
					$Runtime_Cycle_Avg =Sec2Time($Runtime_Cycle_Avg/1000)
					Global $Tempc1=String($Runtime_Cycle_Avg)
					$Tempc=StringTrimLeft($Tempc1,3)
					GUICtrlSetData($Cycle_Avg,$Tempc)
				EndFunc
					Func Calc_Runtime($choice)
    If $iFirst_Run = 0 Then
        $iS_Time = TimerInit()
        $iFirst_Run = 1
    EndIf
    Local $iR_Time = TimerDiff( $iS_Time)
    Switch $choice
        ; 0 is for returning in Integer as seconds;  1 is for proper display time
        Case 0
            Return Int($iR_Time / 1000)
        Case 1
            Local $iHours, $iMins, $iSecs
            _TicksToTime($iR_Time, $iHours, $iMins, $iSecs)
            Return StringFormat("%02i:%02i:%02i", $iHours, $iMins, $iSecs)
    EndSwitch
EndFunc
						Func Sec2Time($nr_sec)
				$nr_sec=$nr_sec
				$sec2time_hour = Int($nr_sec / 3600)
				$sec2time_min = Int(($nr_sec - $sec2time_hour * 3600) / 60)
				$sec2time_sec = $nr_sec - $sec2time_hour * 3600 - $sec2time_min * 60
				Return StringFormat('%02d:%02d:%02d', $sec2time_hour, $sec2time_min, $sec2time_sec)
				EndFunc   ;==>Sec2Time
							Func Update_Runtime()
;~ 							$cCounterG=$cCounterG+1
;~ 							$cCounter_GUI = Mod ( $cCounterG, 4 )
;~ 							If $cCounter_GUI = 0 Then
								GUICtrlSetData($Runtimefrm,Calc_Runtime(1))
;~ 							EndIf
							EndFunc

Func _TimeSystemRestart($iFlag = 0) ;uptime
    Local $iSubTotal = DllCall('kernel32.dll', 'int', 'GetTickCount')
    If Not IsArray($iSubTotal) Then Return SetError(1, 0, 0)
    If $iFlag = 1 Then Return $iSubTotal[0]
    $iSubTotal = $iSubTotal[0] / 1000
    Local $iWeek = Int(($iSubTotal / 604800))
    If $iWeek > 0 Then $iSubTotal -= $iWeek * 604800
    Local $iDay = Int(($iSubTotal / 86400))
    If $iDay > 0 Then $iSubTotal -= $iDay * 86400
    Local $iHour = Int(($iSubTotal / 3600))
    Local $iMin = Int(($iSubTotal - ($iHour * 3600)) / 60)
    Local $iSec = Int(($iSubTotal - $iHour * 3600) - ($iMin * 60))
    Local $sRET = StringFormat('%02d', $iWeek) & ':' & $iDay & ':' & StringFormat('%02d', $iHour) & ':' & _
            StringFormat('%02d', $iMin) & ':' & StringFormat('%02d', $iSec)
    If $iFlag = 2 Then Return $sRET
    Return StringSplit($sRET, ':')
EndFunc

Func Time_Set()
#include<Date.au3>


; For the ActiveTimeBias registry key:
; 4294967296 = 0 for UTC +X:YZ time zones; subtract value of key to get time zone offset.
; EG: 4294976296-4294976236 = 60 = UTC +1:00
;
; UTC time zone uses 0 for the value
;
; UTC -A:BC time zones use the number of minutes of the offset
; EG: 480 = UTC -8:00



; To-Do:
; 1. Add a timezone check to make sure the system is properly configured for its area
; EG: Time Zone is currently "Pacific Standard Time", is this correct? [Y/N]
; 2. Add error checking to _EndOfMonth() should the need arise [user editing of code]
; EG: -2 is not a valid month, you silly goose!


; ----------------------------------------------------------------------------------------------------------------------------------
; Get time from HTTP server (Defaults to google.com ... pool.ntp.org is a good alternative)
; ----------------------------------------------------------------------------------------------------------------------------------
$site = "www.google.com"


$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
;~ $oHTTP.Open("GET", "http://" & $site & "/", False)
;~ $oHTTP.Send()
;~ If @error then
;~ 	MsgBox("","Failed to Ping Google!","No Internet Connection Detected!")
;~ EndIf

$oHTTP.Open("GET", "http://" & $site & "/", False)
$oHTTP.Send()
$date = $oHTTP.GetResponseHeader("Date")


;~ Local $oShell = ObjCreate("winhttp.winhttprequest.5.1")



; ----------------------------------------------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------------------------------------------



; ----------------------------------------------------------------------------------------------------------------------------------
; Set Global variables used throughout the script
; ----------------------------------------------------------------------------------------------------------------------------------

; $tzo: TimeZoneOffset (the number of hours by which the local machine varies from UTC)
Global $tzo = RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation","ActiveTimeBias")

Global $y = StringMid($date,13,4) ; The current year
Global $m = StringMid($date,9,3) ; The current month
Global $d = StringMid($date,6,2) ; The current day of month
Global $h = StringMid($date,18,2) ; The current hour
Global $n = StringMid($date,21,2) ; The current minute
$n=$n+30
Global $s = StringMid($date,24,2) ; The current second

IF $M = "JAN" THEN $M = 1 ; 31 days in month
IF $M = "FEB" THEN $M = 2 ; 28/29 days in month
IF $M = "MAR" THEN $M = 3 ; 31 days in month
IF $M = "APR" THEN $M = 4 ; 30 days in month
IF $M = "MAY" THEN $M = 5 ; 31 days in month
IF $M = "JUN" THEN $M = 6 ; 30 days in month
IF $M = "JUL" THEN $M = 7 ; 31 days in month
IF $M = "AUG" THEN $M = 8 ; 31 days in month
IF $M = "SEP" THEN $M = 9 ; 30 days in month
IF $M = "OCT" THEN $M = 10 ; 31 days in month
IF $M = "NOV" THEN $M = 11 ; 30 days in month
IF $M = "DEC" THEN $M = 12 ; 31 days in month

Global $epm = _EndOfMonth($M-1) ; The last day of the previous month (28-31)
Global $ecm = _EndOfMonth($M) ; The last day of the current month (28-31)

; Correct value for $tzo from the registry value to a +/- number of hours
IF $tzo < 1500 Then
$tzo /= -60
Else
$tzo = (4294967296 - $tzo)/60
EndIf
; ----------------------------------------------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------------------------------------------


; ----------------------------------------------------------------------------------------------------------------------------------
; Calculate time zone changes (correct the hour/day/month/year based on timezone/hour/day/month changes
; ----------------------------------------------------------------------------------------------------------------------------------
$h += $tzo ; Set the local hour based on offset from UTC

Select ; If the hour changes day forward/backward, correct appropriate values.
Case $h >= 24
$d += 1
$h -= 24
Case $h < 0
$d -= 1
$h += 24
EndSelect

Switch $d ; If the day changes month forward/backward, correct appropriate values.
Case $ecm+1
$m += 1
$d = 1
Case 0
$m -= 1
$d = $epm
EndSwitch

Switch $m ; If the month changes year forward/backward, correct appropriate values.
Case 0
$m = 12
$d = 31
$y -= 1
Case 13
$m = 1
$d = 1
$y += 1
EndSwitch
; ----------------------------------------------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------------------------------------------



; ----------------------------------------------------------------------------------------------------------------------------------
; Set system date/time using functions from #include<Date.au3>
; ----------------------------------------------------------------------------------------------------------------------------------
_SetDate($d,$m,$y)
_SetTime($h,$n,$s)
; ----------------------------------------------------------------------------------------------------------------------------------
; ----------------------------------------------------------------------------------------------------------------------------------

EndFunc
	Func _ErrFunc($oError)
    ToolTip2("Internet Down! Failed to use HTTPRequests! Moving on...")
EndFunc   ;==>_ErrFunc

Func _EndOfMonth($vMON)
local $end
Switch $vMON
Case 0, 1, 3, 5, 7, 8, 10, 12, 13
$end = 31
Case 4, 6, 9, 11
$end = 30
Case 2
If IsInt(@YEAR/4) Then
$end = 29
Else
$end = 28
EndIf
Case Else
SetError(-1)
Return(0)
EndSwitch
Return($end)
EndFunc
		Func CheckKey()
Global $Decrypted
Global $Decrypted_Config
Global $CustomerID=$NickName_1
If Not _FileReadToArray($CustomerID&"\"&$CustomerID&".ct83", $Decrypted_Config, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'CustomerID Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
	Exit
EndIf
Global $Decrypted_1 = _ArrayToString($Decrypted_Config)
$Encrypted=$Decrypted_1
Global $Decrypted = StringEncrypt(False, $Encrypted,'cybertech83')
	    ; Display the decrypted text.
;~     MsgBox($MB_SYSTEMMODAL, '', $Decrypted)
CheckExpiry()
CheckHardwareID()
EndFunc
			Func StringEncrypt($bEncrypt, $sData, $sPassword)
    _Crypt_Startup() ; Start the Crypt library.
    Local $sReturn = ''
    If $bEncrypt Then ; If the flag is set to True then encrypt, otherwise decrypt.
        $sReturn = _Crypt_EncryptData($sData, $sPassword, $CALG_AES_256)
    Else
        $sReturn = BinaryToString(_Crypt_DecryptData($sData, $sPassword, $CALG_AES_256))
    EndIf
    _Crypt_Shutdown() ; Shutdown the Crypt library.
    Return $sReturn
EndFunc   ;==>StringEncrypt
				Func CheckExpiry()
Global $Decrypted_Var2 = StringSplit($Decrypted, '@#', $STR_ENTIRESPLIT)
Global $HardwareID2= $Decrypted_Var2[1]
Global $Expiry_Date= $Decrypted_Var2[2]
Global $Decrypted_Var23 = StringSplit($Expiry_Date, '/', $STR_ENTIRESPLIT)
Global $year= Number($Decrypted_Var23[1])
Global $month= Number($Decrypted_Var23[2])
Global $day= Number($Decrypted_Var23[3])
$expdate = Floor(_DateToDayValue($year,$month,$day))
If (Floor(_DateToDayValue(@YEAR, @MON, @MDAY)) > $expdate) Then
	 MsgBox(0, "Error", @YEAR&@MON&@MDAY & " > " & $expdate &" License has expired. Please contact Developer at rohansawantct83@gmail.com, and renew your License! ")
     Exit
Else
EndIf
EndFunc
					Func CheckHardwareID()
$hardware_Current = String(_WinAPI_UniqueHardwareID($UHID_All))
FileDelete("hdid.txt")
FileWrite("hdid.txt",$hardware_Current)
If Not _FileReadToArray("hdid.txt", $hardware_Current_Config, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'HDID Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
	Exit
EndIf
Global $hardware_Current = _ArrayToString($hardware_Current_Config)
Global $HardwareID2= $Decrypted_Var2[1]
If ($hardware_Current=$HardwareID2) then
	ToolTip2("License is  Approved for this Machine.")
Else
	MsgBox(0,"",$hardware_Current&" & "&$HardwareID2& StringToBinary($hardware_Current) &" & "&StringToBinary($HardwareID2)&   "License is Not Approved for this Machine")
	Exit
EndIf
EndFunc
						Func ExpiryGUI()
Global $DaysLeft=$day-@MDAY
GUICtrlSetData($Expirydate_gui,$DaysLeft)
EndFunc

Func UpdateViewsToday()
ToolTip2("Starting to Write in TodaysFile")
WriteViewsTodayFileName()
ReadViews()
WriteViews()
ReadViews()
;~ WriteViews_Details()
EndFunc
	Func WriteViewsTodayFileName()
Global  $SavedDate_Config
Global $FileName_Config
CheckIfSavedDateIsToday()
If Not _FileReadToArray("Date\TodaysDate.ct83", $FileName_Config, 0) Then
MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'Date Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
Exit
EndIf
Global $FileName = _ArrayToString($FileName_Config)
$FileName=$FileName&".ct83"
$FileName=String($FileName)
ToolTip2("Todays File Name is  :"&$FileName )
EndFunc
		Func SaveTodaysDate()
	If FileExists("Date\TodaysDate.ct83") Then
	FileDelete("Date\TodaysDate.ct83")
	EndIf
	ToolTip2("Saved Date Today")
	FileWrite("Date\TodaysDate.ct83",@MDAY&@MON&@Year)
	CheckIfSavedDateIsToday()
EndFunc
			Func CheckIfSavedDateIsToday()
If Not FileExists("Date\TodaysDate.ct83") Then
	SaveTodaysDate()
	EndIf
If Not _FileReadToArray("Date\TodaysDate.ct83", $SavedDate_Config, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'Date Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
	Exit
EndIf
Global $SavedDate = _ArrayToString($SavedDate_Config)
$TodaysDate=Number(@MDAY&@MON&@Year)
ToolTip2("Todays Session Date is : "&$TodaysDate)
$SavedDate=Number($SavedDate)
ToolTip2("The Saved Date is : "&$SavedDate)
If $SavedDate=$TodaysDate Then
	ToolTip2("Match Date")
Else
	ToolTip2("No Match Date")
		CheckIf1030()
		ToolTip2("Check if 1030 called:")
EndIf
EndFunc
				Func CheckIf1030()
ToolTip2("Checking if it is past 10:30")
$CurrentTime=String(_StringStripChars(_NowTime(4), ':'))
$CurrentTime=Number($CurrentTime)
ToolTip2("Current time is " &$CurrentTime)
ToolTip2("Check if Past 1030")
If $CurrentTime> $SessionStartTime Then
	ToolTip2("It is past 10:30")
	SaveTodaysDate()

Else
ToolTip2("It is not past 10:30")
EndIf
EndFunc
					Func _StringStripChars($sString, $sChars)
    If $sChars == '' Then Return SetError(1, 0, $sString)
    If $sString == '' Then Return SetError(2, 0, $sString)
    $sChars = StringRegExpReplace($sChars, '\\([eEqQ])', '\1\\')
    Return StringRegExpReplace($sString, '[\Q' & $sChars & '\E]', '')
EndFunc   ;==>_StringStripChars
						Func WriteViews_Details()
	Local $AttemptedViews_S_Details=String($AttemptedViews)
	Local $SuccessfulViews_S_Details=String($SuccessfulViews)
	Local $TotalViews_S_Details=String($TotalViews1)
	Local $Runtime_S_Details=String($RunTime)
	Local $Runtime_Cycle_Avg_Details=String($Runtime_Cycle_Avg)
	Local $CustomerID_S_Details=String($CustomerID)
	Local $LastWrite_Time_S_Details=String(@HOUR&":"& @MIN&" "&@MDAY &"/"& @MON &"/"& @YEAR)
	Local $Start_Time_S_Details=String($FileName_Session)
	Local $Days_Left_Expiry=String($DaysLeft)
	Local $WDetails_S=String($CustomerID_S_Details&", "&$AttemptedViews_S_Details&", "&$SuccessfulViews_S_Details&", "&$TotalViews_S_Details&", "&$Runtime_Cycle_Avg_Details&", " &$Runtime_S_Details&", "&$Start_Time_S_Details&", "&$LastWrite_Time_S_Details&", "& $Days_Left_Expiry)
	ToolTip2("Writing Following views in File #Details :" &$WDetails_S)
	FileWrite("Views_Details\"&$FileName_Session&".ct83",$WDetails_S)
	EndFunc
							Func WriteViews($iChoice="")
	Switch $iChoice
		Case "success"
			$StoredViews=$StoredViews+1
	EndSwitch
	$TotalViews1=$StoredViews
	Local $AttemptedViews_S=String($TotalViews1)
    ToolTip2("Writing Following views in File  :" &$AttemptedViews_S)
	FileDelete("Views\"&$Filename)
	FileWrite("Views\"&$Filename,$AttemptedViews_S)
EndFunc   ;==>Example
								Func ReadViews()
	If Not _FileReadToArray("Views\"&$FileName, $StoredViews, 0) Then
	GUICtrlSetData($TotalViews,00)
	EndIf
ToolTip2("Reading from File "&$FileName)
Local $StoredViews_1 = _ArrayToString($StoredViews)
$StoredViews=$StoredViews_1
ToolTip2("Views  :"& $StoredViews)
GUICtrlSetData($TotalViews,$StoredViews)
EndFunc   ;==>Example
									Func WriteToCSV();columns were changed to rows and vice versa
DirCreate(@ScriptDir&"\Logs\CSV\")
Local $sFilePath=String(@ScriptDir&"\Logs\CSV\"&$FileName_Session&".csv")
$WCSV[$iWCSV_i][Int(@HOUR)]=GUICtrlRead($S_Avg)
If $iLastCallHr=@HOUR Then
$iWCSV_i=$iWCSV_i+1
ToolTip2("Hours Same as last call, Incremented: "&$iWCSV_i)
Else
$iWCSV_i=0
ToolTip2("Hours Not Same as last call, Zeroed: "&$iWCSV_i)
EndIf
DeleteFile($sFilePath)
ToolTip2("Write to CSV Array: "& _ArrayToString($WCSV,""))
$rows = UBound($WCSV) - 1
$columns = UBound($WCSV, 2) -1
ToolTip2("W.CSV Rows: "& $rows&"Columns: "& $columns)
For $i = 0 To $rows
    $sLine = ""
    For $j = 0 To $columns
        $sLine &= $WCSV[$i][$j] & ","
    Next
    FileWriteLine($sFilePath, StringTrimRight($sLine, 1))
	ToolTip2("Writing :"&StringTrimRight($sLine, 1)&"in "&$sFilePath)
Next
$iLastCallHr=@HOUR
ToolTip2("W.CSV LastCallHr Set to :"&$iLastCallHr)
EndFunc

Func Push_AllInfo($iPushafter,$GFPsh_Tk1,$GFPsh_Tk2,$GFPsh_Tk3,$GFPsh_Tk4,$cMsg_T="",$cMsg_B="",$iForce=0);add more info here as every push is precious
If $GPsh_Chk=1 Then
	If $cMsg_T="" And $cMsg_B="" Then
$cCounter_push=$cCounter_push+1
Local $cCounter_push1 = Mod ( $cCounter_push, $iPushafter )
ToolTip2("Pushbullet Aft. Cyc :" &$iPushafter)
ToolTip2("Pushbullet Ctr. Cyc :" &$cCounter_push)
		If $cCounter_push1 = 0  Or $iForce=1 Then
			Local $AttemptedViews_S_D=String($AttemptedViews)
			Local $SuccessfulViews_S_D=String($SuccessfulViews)
			Local $SuccessRate=String(Round(GUICtrlRead($S_Rate),2))
			Local $sStoredViews=String($StoredViews)
			Local $CustomerID_S_D=String($CustomerID)
			Local $Runtime_S_D=String(Calc_Runtime(1))
			Local $Runtime_Cycle_Avg_D=String($Tempc)
			Local $SentAt_S_D=String(@HOUR&":"& @MIN&" "&@MDAY &"/"& @MON &"/"& @YEAR)
			Local $Start_Time_S_D=String($FileName_Session)
			Local $sTotalEarnings=String(GUICtrlRead($Eco_Total))
			Local $sEarning_Rate=String(GUICtrlRead($Eco_Rate))
			Local $sNeceAvg=String(GUICtrlRead($Cycle_Nece))
			$sNeceAvg=StringTrimRight($sNeceAvg,3)
			Local $S_Avg_D=String(GUICtrlRead($S_Avg))
			Local $S_Target=String(GUICtrlRead($Tar_Today_Nece))
			Local $sPushbullet_Data=String("Stored Views:"&$sStoredViews&" Views:"&$SuccessfulViews_S_D&"/"&$AttemptedViews_S_D&" Target V:"&$S_Target&" S. Rate:"&$SuccessRate&" Avg:"&$Runtime_Cycle_Avg_D&" S.Avg:"&$S_Avg_D&" Nece. Avg:"&$sNeceAvg&" Runtime:"&$Runtime_S_D&" Total Earning:"&$sTotalEarnings&" Rate:"&$sEarning_Rate&" Send Time:"&$SentAt_S_D)
			ToolTip2("Sending PushBullet! Please Wait...")
			Send_Pushbullet(@ComputerName&"-"&$GLoginID,$sPushbullet_Data,$GFPsh_Tk1)
;~ 			Send_Pushbullet(@ComputerName&"-"&$GLoginID,$sPushbullet_Data,$GFPsh_Tk2)
;~ 			Send_Pushbullet(@ComputerName&"-"&$GLoginID,$sPushbullet_Data,$GFPsh_Tk3)
;~ 			Send_Pushbullet(@ComputerName&"-"&$GLoginID,$sPushbullet_Data,$GFPsh_Tk4)
			$cCounter_sent=$cCounter_sent+1
			GUICtrlSetData($Psh_Sent,$cCounter_sent)
		EndIf
		Else
		$cMsg_T=String($cMsg_T)
		$cMsg_B=String($cMsg_B)
		ToolTip2("Sending Initialised PushBullet! Please Wait...")
		CurrentProgress(70)
		Send_Pushbullet($cMsg_T,$cMsg_B,$GFPsh_Tk1)
		Send_Pushbullet($cMsg_T,$cMsg_B,$GFPsh_Tk2)
		Send_Pushbullet($cMsg_T,$cMsg_B,$GFPsh_Tk3)
		Send_Pushbullet($cMsg_T,$cMsg_B,$GFPsh_Tk4)
	EndIf
EndIf
EndFunc
	Func Send_Pushbullet($spTitle,$sBody,$GFPsh_Tk)
;~ $FileType="file"
;~ $File="image.bmp"
;~ $fLink="image.bmp"
Local $sPD = '{"type": "note", "title": "'&$spTitle&'","body": "'&$sBody&'"}'
;~ Local $sPD = '{"type": "file", "file_name": "' & $File & '", "file_type": "' & $FileType & '", "file_url": "' & $fLink & '", "title": "' & $spTitle & '", "body": "' & $sBody & '"}'
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
$oHTTP.Open("POST", "https://api.pushbullet.com/v2/pushes", False)
$oHTTP.setRequestHeader("Authorization", "Bearer " & $GFPsh_Tk)
$oHTTP.SetRequestHeader("Content-Type", "application/json")
$oHTTP.Send($sPD)
$Result = $oHTTP.ResponseText
ToolTip2("PushBullet :"&$Result)
ToolTip2("PushBullet Sent - "&$spTitle&" : "&$sBody&" "&$GFPsh_Tk)
;~ ToolTip2("Send("&$sPD&") Failed! Error Connecting to the Internet!")
EndFunc

Func Get_Earnings($iViews)
;limits
Local $iSlab_1=1201
Local $iSlab_2=801
Local $iSlab_3=401
Local $iSlab_4=101

;earnings
Local $ieSlab_1=0.75
Local $ieSlab_2=0.55
Local $ieSlab_3=0.35
Local $ieSlab_4=0.20
Local $ieSlab_min=0.05
If $iViews >= $iSlab_1 Then
	$fIncome=$iViews*$ieSlab_1
	GUICtrlSetData($Eco_Rate,$ieSlab_1)
	Return $fIncome
Else
	If $iViews >= $iSlab_2 Then
		$fIncome=$iViews*$ieSlab_2
		GUICtrlSetData($Eco_Rate,$ieSlab_2)
		Return $fIncome
	Else
		If $iViews >= $iSlab_3 Then
			$fIncome=$iViews*$ieSlab_3
			GUICtrlSetData($Eco_Rate,$ieSlab_3)
			Return $fIncome
		Else
			If $iViews >= $iSlab_4 Then
				$fIncome=$iViews*$ieSlab_4
				GUICtrlSetData($Eco_Rate,$ieSlab_4)
				Return $fIncome
			Else
				If $iViews < $iSlab_4 Then
					$fIncome=$iViews*$ieSlab_min
					GUICtrlSetData($Eco_Rate,$ieSlab_min)
					Return $fIncome
				EndIf
			EndIf
		EndIf
	EndIf
EndIf
EndFunc
	Func Get_TargetEarnings()
ToolTip2("Getting Targeted Earnings...")
Local $iViews2=$TarToday
;limits
Local $iSlab_1=1201
Local $iSlab_2=801
Local $iSlab_3=401
Local $iSlab_4=101

;earnings
Local $ieSlab_1=0.75
Local $ieSlab_2=0.55
Local $ieSlab_3=0.35
Local $ieSlab_4=0.20
Local $ieSlab_min=0.10

If $iViews2 >= $iSlab_1 Then
	$fIncome2=$iViews2*$ieSlab_1
;~ 	Return $fIncome2
Else
	If $iViews2 >= $iSlab_2 Then
		$fIncome2=$iViews2*$ieSlab_2
;~ 		Return $fIncome2
	Else
		If $iViews2 >= $iSlab_3 Then
			$fIncome2=$iViews2*$ieSlab_3
;~ 			Return $fIncome2
		Else
			If $iViews2 >= $iSlab_4 Then
				$fIncome2=$iViews2*$ieSlab_4
;~ 				Return $fIncome2
			Else
				If $iViews2 < $iSlab_4 Then
					$fIncome2=$iViews2*$ieSlab_min
;~ 					Return $fIncome2
				EndIf
			EndIf
		EndIf
	EndIf
EndIf
ToolTip2("Income : "&$fIncome2)
GUICtrlSetData($Eco_Tar,$fIncome2)
		EndFunc

Func ControlClick2($scTitle,$scText,$scControlId,$scButton,$icClicks,$icX,$icY)
;~ ToolTip2("C. Clicking " &"("& $icX &","& $icY &")")
Local $OffSetX=0
Local $OffSetY=0
ControlClick($scTitle,$scText,$scControlId,$scButton,$icClicks,$icX+$OffSetX,$icY+$OffSetY)
EndFunc
	Func DeleteFile($file)

    $file_usage = FileOpen($file, 1)

    If $file_usage = -1 Then
;~         MsgBox(0, @ScriptName, $file & " is in use." & @CRLF & _
;~ 'Please close it before continuing.')
			        Exit
    EndIf

    FileClose($file_usage)

    If FileExists($file) Then
        FileDelete($file)
    EndIf

EndFunc
Func Calibrate_Main()
ToolTip2("Starting Calibration")
MsgBox("",$g_sAppFullTitle, "First Open Chrome, LogIn to the website and then close the Window. Don't log out as we need to see the Clear Login Button!")
;~ NavigateToWebsite()
WriteCoords("LoginTextField",1); click the log in text field on videozbpohomepage
WriteCoords("ClearLoginBtn",1); click the clear log in button
WriteCoords("OpenWorkspaceBtn",1); click the Open workspace button
;~ ClickView()
;wait till the video has played upto 50 seconds then press a key
MsgBox("",$g_sAppFullTitle, "Wait till the video has played upto 50 seconds then Pause the video, click OK ")

Local $iSatisfied=0
While $iSatisfied=0
WriteCoords("DisplayTimeUpperLeft",1); click the upperright corner of the display time dialogue box
WriteCoords("DisplayTimeLowerRight",1); click the lowerright corner of the display time dialogue box
Global $DisplayTimeUpperLeft = LocationRead("DisplayTimeUpperLeft",1); read the upperright corner of the display time dialogue box
Global $DisplayTimeLowerRight = LocationRead("DisplayTimeLowerRight",1); read the lowerright corner of the display time dialogue box
WinActivate("Click ")
FileDelete("image.bmp")
_ScreenCapture_Capture("image.bmp", $DisplayTimeUpperLeft[0],$DisplayTimeUpperLeft[1], $DisplayTimeLowerRight[0],$DisplayTimeLowerRight[1]) ;try to capture timing
ShellExecuteWait("image.bmp")
$ans = MsgBox(3,$g_sAppFullTitle,"Is this Screenshot OK?")
Select
    Case $ans = 6
		$iSatisfied=1
    Case $ans = 7
		$iSatisfied=0
EndSelect
Wend
WriteCoords("VideoViewerCloseBtn",1); click the Close Video Viewer button
ProcessClose("Chrome.exe")
ToolTip2("Chrome Killed!")
FirstLoad()
EndFunc
	Func Calibrate_Del()
ToolTip2("Deleting All Calibrated Settings...")
DirRemove($sSavedPath&"Locations\")
EndFunc
		Func WriteCoords($j_Place,$j_Counter,$j_PlaceTxt=$j_Place)
	MsgBox("",$g_sAppFullTitle, "Click your "&$j_PlaceTxt&" "&$j_Counter&" after you click 'Ok'. " )
	Local $dll = DllOpen("user32.dll")
	While 1
		Sleep (25)
		If _IsPressed("01", $dll) Then
		AutoItSetOption('MouseCoordMode',0)
		$MousePos = MouseGetPos()
		ExitLoop
		EndIf
	WEnd
	DllClose($dll)
	$Coords=$MousePos
	DirCreate($sSavedPath)
	FileDelete($sSavedPath&"Locations\"&$j_Place&$j_Counter&".ct83")
	FileWrite($sSavedPath&"Locations\"&$j_Place&$j_Counter&".ct83",$Coords[0]&","&$Coords[1])
	ToolTip2("Location of "& $j_Place&$j_Counter& " is "& $Coords[0]&","&$Coords[1])
	Return $Coords
EndFunc
			Func LocationRead($j_Place,$j_Counter)
Local $LocV, $LocV1[3], $iCoords[3]
$j_Counter=String($j_Counter)
FileChangeDir(@ScriptDir)
If Not _FileReadToArray($sSavedPath&"Locations\"&$j_Place&$j_Counter&".ct83", $LocV1) Then
	MsgBox($MB_SYSTEMMODAL, "", "No Saved Config Data was found please repeat 'Setup' in the settings tab. Setup will automatically start after you click 'OK'")
	ToolTip2("No Saved Config Data was found. Calibration will automatically start")
	Calibrate_Main()
EndIf
$LocV = _ArrayToString($LocV1)
$LocV1 = StringTrimLeft($LocV,2) ; Remove the 5 rightmost characters from the string.
$LocV1=StringSplit($LocV1,",")
$iCoords[0]=Int($LocV1[1])
$iCoords[1]=Int($LocV1[2])
ToolTip2("Location of "& $j_Place&$j_Counter& "is "& $iCoords[0]&$iCoords[1])
Return($iCoords);an aray which contains coords
EndFunc