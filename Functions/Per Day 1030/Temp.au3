#RequireAdmin
#include <Date.au3>
#include <File.au3>
Global $Day=@MDAY
Global $Month=@MON
Global $Year=@YEAR
FileWrite("Date\TodaysDate.ct83",$Day&"#&"&$Month&"#&"&$Year)


Global $SavedDate=""
If FileExists("Date\TodaysDate.ct83") Then
If Not _FileReadToArray("Date\TodaysDate.ct83", $SavedDate, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'SavedDate Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
	Exit
EndIf
Else
	SaveTodaysDate()
Global $Decrypted_1 = _ArrayToString($Decrypted_Config)



Global $Decrypted_Var2 = StringSplit($Decrypted, '@#', $STR_ENTIRESPLIT)
Global $HardwareID2= $Decrypted_Var2[1]
Global $Expiry_Date= $Decrypted_Var2[2]


Global $Decrypted_Var23 = StringSplit($Expiry_Date, '/', $STR_ENTIRESPLIT)
Global $year= Number($Decrypted_Var23[1])
Global $month= Number($Decrypted_Var23[2])
Global $day= Number($Decrypted_Var23[3])
;~ MsgBox(0,"Expiry Date","The Expiry Date is "&$day&"/"&$month&"/"&$year)
$expdate = Floor(_DateToDayValue($year,$month,$day))
If (Floor(_DateToDayValue(@YEAR, @MON, @MDAY)) > $expdate) Then
     MsgBox(0, "Error", "License has expired. Please contact Developer at rohansawantct83@gmail.com, and renew your License! ")
     Exit


;~ Global $Day=@MDAY
;~ Global $Month=@MON
;~ Global $Year=@YEAR
Global $SavedDate_Config
;~ SaveTodaysDate()
CheckIfSavedDateIsToday()
Func CheckIfSavedDateIsToday()
If FileExists("Date\TodaysDate.ct83") Then
MsgBox("","","Reading what is stored")
;~ MsgBox("","","Running Checkif")
If Not _FileReadToArray("Date\TodaysDate.ct83", $SavedDate_Config, 0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error Reading the 'CustomerID Configuration File'! Please Try again! Using the CustomerID supplied to you. For technical Support Contact Developer at rohansawantct83@gmail.com")
	Exit
EndIf
Global $SavedDate = _ArrayToString($SavedDate_Config)
$SavedDate=Number($SavedDate)
Global $SavedDate_StringSplitArr = StringSplit($SavedDate, '#&', $STR_ENTIRESPLIT)
Global $Saved_Day= Number($SavedDate_StringSplitArr[1])
MsgBox("","",$SavedDate_StringSplitArr[1])
Global $Saved_Month=Number($SavedDate_StringSplitArr[2])
MsgBox("","",$SavedDate_StringSplitArr[2])
Global $Saved_Year=Number($SavedDate_StringSplitArr[3])
MsgBox("","",$SavedDate_StringSplitArr[3])
MsgBox("","",$Saved_Day&$Saved_Month&$Saved_Year)
	$Mday_S=$Day
	$Mon_S=$Month
	$Year_S=$Year
	MsgBox("","",$Saved_Day&$Mday_S)
	MsgBox("","",$Saved_Month&$Mon_S)
	MsgBox("","",$Saved_Year&$Year_S)
	$Todaysdate = Floor(_DateToDayValue(@MDAY,@Mon,@Year))
	$Todaysdate = String(@MDAY&@Mon&@Year)
	MsgBox("","",$SavedDate&$Todaysdate)
If $SavedDate=$Todaysdate Then
    MsgBox("","","Match")
	SaveTodaysDate()
	EndIf
Else
SaveTodaysDate()
EndIf
