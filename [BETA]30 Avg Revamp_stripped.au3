#RequireAdmin
Global Const $PBS_MARQUEE = 0x00000008
Global Const $__PROGRESSBARCONSTANT_WM_USER = 0X400
Global Const $PBM_SETMARQUEE = $__PROGRESSBARCONSTANT_WM_USER + 10
Global Const $WS_HSCROLL = 0x00100000
Global Const $WS_VSCROLL = 0x00200000
Global Const $WS_BORDER = 0x00800000
Global Const $WS_POPUP = 0x80000000
Global Const $WS_EX_STATICEDGE = 0x00020000
Global Const $WS_EX_TOOLWINDOW = 0x00000080
Global Const $WS_EX_TOPMOST = 0x00000008
Global Const $WS_EX_WINDOWEDGE = 0x00000100
Global Const $SS_CENTER = 0x1
Global Const $GDIP_EPGCOLORDEPTH = '{66087055-AD66-4C7C-9A18-38A2310B8337}'
Global Const $GDIP_EPGCOMPRESSION = '{E09D739D-CCD4-44EE-8EBA-3FBF8BE4FC58}'
Global Const $GDIP_EPGQUALITY = '{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}'
Global Const $GDIP_EPTLONG = 4
Global Const $GDIP_EVTCOMPRESSIONLZW = 2
Global Const $GDIP_PXF24RGB = 0x00021808
Global Const $tagPOINT = "struct;long X;long Y;endstruct"
Global Const $tagRECT = "struct;long Left;long Top;long Right;long Bottom;endstruct"
Global Const $tagSYSTEMTIME = "struct;word Year;word Month;word Dow;word Day;word Hour;word Minute;word Second;word MSeconds;endstruct"
Global Const $tagGDIPENCODERPARAM = "struct;byte GUID[16];ulong NumberOfValues;ulong Type;ptr Values;endstruct"
Global Const $tagGDIPENCODERPARAMS = "uint Count;" & $tagGDIPENCODERPARAM
Global Const $tagGDIPSTARTUPINPUT = "uint Version;ptr Callback;bool NoThread;bool NoCodecs"
Global Const $tagGDIPIMAGECODECINFO = "byte CLSID[16];byte FormatID[16];ptr CodecName;ptr DllName;ptr FormatDesc;ptr FileExt;" & "ptr MimeType;dword Flags;dword Version;dword SigCount;dword SigSize;ptr SigPattern;ptr SigMask"
Global Const $tagREBARBANDINFO = "uint cbSize;uint fMask;uint fStyle;dword clrFore;dword clrBack;ptr lpText;uint cch;" & "int iImage;hwnd hwndChild;uint cxMinChild;uint cyMinChild;uint cx;handle hbmBack;uint wID;uint cyChild;uint cyMaxChild;" & "uint cyIntegral;uint cxIdeal;lparam lParam;uint cxHeader" &((@OSVersion = "WIN_XP") ? "" : ";" & $tagRECT & ";uint uChevronState")
Global Const $tagGUID = "struct;ulong Data1;ushort Data2;ushort Data3;byte Data4[8];endstruct"
Global Const $tagSECURITY_ATTRIBUTES = "dword Length;ptr Descriptor;bool InheritHandle"
Global Const $UBOUND_DIMENSIONS = 0
Global Const $UBOUND_ROWS = 1
Global Const $UBOUND_COLUMNS = 2
Global Const $FO_READ = 0
Global Const $FRTA_NOCOUNT = 0
Global Const $FRTA_COUNT = 1
Global Const $FRTA_INTARRAYS = 2
Global Const $FRTA_ENTIRESPLIT = 4
Global Const $MB_SYSTEMMODAL = 4096
Func _SendMessage($hWnd, $iMsg, $wParam = 0, $lParam = 0, $iReturn = 0, $wParamType = "wparam", $lParamType = "lparam", $sReturnType = "lresult")
Local $aResult = DllCall("user32.dll", $sReturnType, "SendMessageW", "hwnd", $hWnd, "uint", $iMsg, $wParamType, $wParam, $lParamType, $lParam)
If @error Then Return SetError(@error, @extended, "")
If $iReturn >= 0 And $iReturn <= 4 Then Return $aResult[$iReturn]
Return $aResult
EndFunc
Global Const $STR_STRIPLEADING = 1
Global Const $STR_STRIPTRAILING = 2
Global Const $STR_CHRSPLIT = 0
Global Const $STR_ENTIRESPLIT = 1
Global Const $STR_NOCOUNT = 2
Global Const $HGDI_ERROR = Ptr(-1)
Global Const $INVALID_HANDLE_VALUE = Ptr(-1)
Global Const $KF_EXTENDED = 0x0100
Global Const $KF_ALTDOWN = 0x2000
Global Const $KF_UP = 0x8000
Global Const $LLKHF_EXTENDED = BitShift($KF_EXTENDED, 8)
Global Const $LLKHF_ALTDOWN = BitShift($KF_ALTDOWN, 8)
Global Const $LLKHF_UP = BitShift($KF_UP, 8)
Global Const $tagCURSORINFO = "dword Size;dword Flags;handle hCursor;" & $tagPOINT
Global Const $tagICONINFO = "bool Icon;dword XHotSpot;dword YHotSpot;handle hMask;handle hColor"
Func _WinAPI_BitBlt($hDestDC, $iXDest, $iYDest, $iWidth, $iHeight, $hSrcDC, $iXSrc, $iYSrc, $iROP)
Local $aResult = DllCall("gdi32.dll", "bool", "BitBlt", "handle", $hDestDC, "int", $iXDest, "int", $iYDest, "int", $iWidth, "int", $iHeight, "handle", $hSrcDC, "int", $iXSrc, "int", $iYSrc, "dword", $iROP)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_CopyIcon($hIcon)
Local $aResult = DllCall("user32.dll", "handle", "CopyIcon", "handle", $hIcon)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_CreateCompatibleBitmap($hDC, $iWidth, $iHeight)
Local $aResult = DllCall("gdi32.dll", "handle", "CreateCompatibleBitmap", "handle", $hDC, "int", $iWidth, "int", $iHeight)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_CreateCompatibleDC($hDC)
Local $aResult = DllCall("gdi32.dll", "handle", "CreateCompatibleDC", "handle", $hDC)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_DeleteDC($hDC)
Local $aResult = DllCall("gdi32.dll", "bool", "DeleteDC", "handle", $hDC)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_DeleteObject($hObject)
Local $aResult = DllCall("gdi32.dll", "bool", "DeleteObject", "handle", $hObject)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_DestroyIcon($hIcon)
Local $aResult = DllCall("user32.dll", "bool", "DestroyIcon", "handle", $hIcon)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_DrawIcon($hDC, $iX, $iY, $hIcon)
Local $aResult = DllCall("user32.dll", "bool", "DrawIcon", "handle", $hDC, "int", $iX, "int", $iY, "handle", $hIcon)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_GetCursorInfo()
Local $tCursor = DllStructCreate($tagCURSORINFO)
Local $iCursor = DllStructGetSize($tCursor)
DllStructSetData($tCursor, "Size", $iCursor)
Local $aRet = DllCall("user32.dll", "bool", "GetCursorInfo", "struct*", $tCursor)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, 0)
Local $aCursor[5]
$aCursor[0] = True
$aCursor[1] = DllStructGetData($tCursor, "Flags") <> 0
$aCursor[2] = DllStructGetData($tCursor, "hCursor")
$aCursor[3] = DllStructGetData($tCursor, "X")
$aCursor[4] = DllStructGetData($tCursor, "Y")
Return $aCursor
EndFunc
Func _WinAPI_GetDC($hWnd)
Local $aResult = DllCall("user32.dll", "handle", "GetDC", "hwnd", $hWnd)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetDesktopWindow()
Local $aResult = DllCall("user32.dll", "hwnd", "GetDesktopWindow")
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetIconInfo($hIcon)
Local $tInfo = DllStructCreate($tagICONINFO)
Local $aRet = DllCall("user32.dll", "bool", "GetIconInfo", "handle", $hIcon, "struct*", $tInfo)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, 0)
Local $aIcon[6]
$aIcon[0] = True
$aIcon[1] = DllStructGetData($tInfo, "Icon") <> 0
$aIcon[2] = DllStructGetData($tInfo, "XHotSpot")
$aIcon[3] = DllStructGetData($tInfo, "YHotSpot")
$aIcon[4] = DllStructGetData($tInfo, "hMask")
$aIcon[5] = DllStructGetData($tInfo, "hColor")
Return $aIcon
EndFunc
Func _WinAPI_GetSystemMetrics($iIndex)
Local $aResult = DllCall("user32.dll", "int", "GetSystemMetrics", "int", $iIndex)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GUIDFromString($sGUID)
Local $tGUID = DllStructCreate($tagGUID)
_WinAPI_GUIDFromStringEx($sGUID, $tGUID)
If @error Then Return SetError(@error + 10, @extended, 0)
Return $tGUID
EndFunc
Func _WinAPI_GUIDFromStringEx($sGUID, $tGUID)
Local $aResult = DllCall("ole32.dll", "long", "CLSIDFromString", "wstr", $sGUID, "struct*", $tGUID)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_ReleaseDC($hWnd, $hDC)
Local $aResult = DllCall("user32.dll", "int", "ReleaseDC", "hwnd", $hWnd, "handle", $hDC)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_SelectObject($hDC, $hGDIObj)
Local $aResult = DllCall("gdi32.dll", "handle", "SelectObject", "handle", $hDC, "handle", $hGDIObj)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_StringFromGUID($tGUID)
Local $aResult = DllCall("ole32.dll", "int", "StringFromGUID2", "struct*", $tGUID, "wstr", "", "int", 40)
If @error Or Not $aResult[0] Then Return SetError(@error, @extended, "")
Return SetExtended($aResult[0], $aResult[2])
EndFunc
Func _WinAPI_WideCharToMultiByte($vUnicode, $iCodePage = 0, $bRetString = True)
Local $sUnicodeType = "wstr"
If Not IsString($vUnicode) Then $sUnicodeType = "struct*"
Local $aResult = DllCall("kernel32.dll", "int", "WideCharToMultiByte", "uint", $iCodePage, "dword", 0, $sUnicodeType, $vUnicode, "int", -1, "ptr", 0, "int", 0, "ptr", 0, "ptr", 0)
If @error Or Not $aResult[0] Then Return SetError(@error + 20, @extended, "")
Local $tMultiByte = DllStructCreate("char[" & $aResult[0] & "]")
$aResult = DllCall("kernel32.dll", "int", "WideCharToMultiByte", "uint", $iCodePage, "dword", 0, $sUnicodeType, $vUnicode, "int", -1, "struct*", $tMultiByte, "int", $aResult[0], "ptr", 0, "ptr", 0)
If @error Or Not $aResult[0] Then Return SetError(@error + 10, @extended, "")
If $bRetString Then Return DllStructGetData($tMultiByte, 1)
Return $tMultiByte
EndFunc
Global Const $tagOSVERSIONINFO = 'struct;dword OSVersionInfoSize;dword MajorVersion;dword MinorVersion;dword BuildNumber;dword PlatformId;wchar CSDVersion[128];endstruct'
Global Const $__WINVER = __WINVER()
Func __WINVER()
Local $tOSVI = DllStructCreate($tagOSVERSIONINFO)
DllStructSetData($tOSVI, 1, DllStructGetSize($tOSVI))
Local $aRet = DllCall('kernel32.dll', 'bool', 'GetVersionExW', 'struct*', $tOSVI)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, 0)
Return BitOR(BitShift(DllStructGetData($tOSVI, 2), -8), DllStructGetData($tOSVI, 3))
EndFunc
Global $__g_hGDIPDll = 0
Global $__g_iGDIPRef = 0
Global $__g_iGDIPToken = 0
Global $__g_bGDIP_V1_0 = True
Func _GDIPlus_BitmapCloneArea($hBitmap, $nLeft, $nTop, $nWidth, $nHeight, $iFormat = 0x00021808)
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipCloneBitmapArea", "float", $nLeft, "float", $nTop, "float", $nWidth, "float", $nHeight, "int", $iFormat, "handle", $hBitmap, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $aResult[0] Then Return SetError(10, $aResult[0], 0)
Return $aResult[7]
EndFunc
Func _GDIPlus_BitmapCreateFromHBITMAP($hBitmap, $hPal = 0)
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipCreateBitmapFromHBITMAP", "handle", $hBitmap, "handle", $hPal, "handle*", 0)
If @error Then Return SetError(@error, @extended, 0)
If $aResult[0] Then Return SetError(10, $aResult[0], 0)
Return $aResult[3]
EndFunc
Func _GDIPlus_Encoders()
Local $iCount = _GDIPlus_EncodersGetCount()
Local $iSize = _GDIPlus_EncodersGetSize()
Local $tBuffer = DllStructCreate("byte[" & $iSize & "]")
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipGetImageEncoders", "uint", $iCount, "uint", $iSize, "struct*", $tBuffer)
If @error Then Return SetError(@error, @extended, 0)
If $aResult[0] Then Return SetError(10, $aResult[0], 0)
Local $pBuffer = DllStructGetPtr($tBuffer)
Local $tCodec, $aInfo[$iCount + 1][14]
$aInfo[0][0] = $iCount
For $iI = 1 To $iCount
$tCodec = DllStructCreate($tagGDIPIMAGECODECINFO, $pBuffer)
$aInfo[$iI][1] = _WinAPI_StringFromGUID(DllStructGetPtr($tCodec, "CLSID"))
$aInfo[$iI][2] = _WinAPI_StringFromGUID(DllStructGetPtr($tCodec, "FormatID"))
$aInfo[$iI][3] = _WinAPI_WideCharToMultiByte(DllStructGetData($tCodec, "CodecName"))
$aInfo[$iI][4] = _WinAPI_WideCharToMultiByte(DllStructGetData($tCodec, "DllName"))
$aInfo[$iI][5] = _WinAPI_WideCharToMultiByte(DllStructGetData($tCodec, "FormatDesc"))
$aInfo[$iI][6] = _WinAPI_WideCharToMultiByte(DllStructGetData($tCodec, "FileExt"))
$aInfo[$iI][7] = _WinAPI_WideCharToMultiByte(DllStructGetData($tCodec, "MimeType"))
$aInfo[$iI][8] = DllStructGetData($tCodec, "Flags")
$aInfo[$iI][9] = DllStructGetData($tCodec, "Version")
$aInfo[$iI][10] = DllStructGetData($tCodec, "SigCount")
$aInfo[$iI][11] = DllStructGetData($tCodec, "SigSize")
$aInfo[$iI][12] = DllStructGetData($tCodec, "SigPattern")
$aInfo[$iI][13] = DllStructGetData($tCodec, "SigMask")
$pBuffer += DllStructGetSize($tCodec)
Next
Return $aInfo
EndFunc
Func _GDIPlus_EncodersGetCLSID($sFileExtension)
Local $aEncoders = _GDIPlus_Encoders()
If @error Then Return SetError(@error, 0, "")
For $iI = 1 To $aEncoders[0][0]
If StringInStr($aEncoders[$iI][6], "*." & $sFileExtension) > 0 Then Return $aEncoders[$iI][1]
Next
Return SetError(-1, -1, "")
EndFunc
Func _GDIPlus_EncodersGetCount()
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipGetImageEncodersSize", "uint*", 0, "uint*", 0)
If @error Then Return SetError(@error, @extended, -1)
If $aResult[0] Then Return SetError(10, $aResult[0], -1)
Return $aResult[1]
EndFunc
Func _GDIPlus_EncodersGetSize()
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipGetImageEncodersSize", "uint*", 0, "uint*", 0)
If @error Then Return SetError(@error, @extended, -1)
If $aResult[0] Then Return SetError(10, $aResult[0], -1)
Return $aResult[2]
EndFunc
Func _GDIPlus_ImageDispose($hImage)
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipDisposeImage", "handle", $hImage)
If @error Then Return SetError(@error, @extended, False)
If $aResult[0] Then Return SetError(10, $aResult[0], False)
Return True
EndFunc
Func _GDIPlus_ImageGetHeight($hImage)
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipGetImageHeight", "handle", $hImage, "uint*", 0)
If @error Then Return SetError(@error, @extended, -1)
If $aResult[0] Then Return SetError(10, $aResult[0], -1)
Return $aResult[2]
EndFunc
Func _GDIPlus_ImageGetWidth($hImage)
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipGetImageWidth", "handle", $hImage, "uint*", -1)
If @error Then Return SetError(@error, @extended, -1)
If $aResult[0] Then Return SetError(10, $aResult[0], -1)
Return $aResult[2]
EndFunc
Func _GDIPlus_ImageSaveToFileEx($hImage, $sFileName, $sEncoder, $tParams = 0)
Local $tGUID = _WinAPI_GUIDFromString($sEncoder)
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipSaveImageToFile", "handle", $hImage, "wstr", $sFileName, "struct*", $tGUID, "struct*", $tParams)
If @error Then Return SetError(@error, @extended, False)
If $aResult[0] Then Return SetError(10, $aResult[0], False)
Return True
EndFunc
Func _GDIPlus_ParamAdd(ByRef $tParams, $sGUID, $iNbOfValues, $iType, $pValues)
Local $iCount = DllStructGetData($tParams, "Count")
Local $pGUID = DllStructGetPtr($tParams, "GUID") +($iCount * _GDIPlus_ParamSize())
Local $tParam = DllStructCreate($tagGDIPENCODERPARAM, $pGUID)
_WinAPI_GUIDFromStringEx($sGUID, $pGUID)
DllStructSetData($tParam, "Type", $iType)
DllStructSetData($tParam, "NumberOfValues", $iNbOfValues)
DllStructSetData($tParam, "Values", $pValues)
DllStructSetData($tParams, "Count", $iCount + 1)
EndFunc
Func _GDIPlus_ParamInit($iCount)
Local $sStruct = $tagGDIPENCODERPARAMS
For $i = 2 To $iCount
$sStruct &= ";struct;byte[16];ulong;ulong;ptr;endstruct"
Next
Return DllStructCreate($sStruct)
EndFunc
Func _GDIPlus_ParamSize()
Local $tParam = DllStructCreate($tagGDIPENCODERPARAM)
Return DllStructGetSize($tParam)
EndFunc
Func _GDIPlus_Shutdown()
If $__g_hGDIPDll = 0 Then Return SetError(-1, -1, False)
$__g_iGDIPRef -= 1
If $__g_iGDIPRef = 0 Then
DllCall($__g_hGDIPDll, "none", "GdiplusShutdown", "ulong_ptr", $__g_iGDIPToken)
DllClose($__g_hGDIPDll)
$__g_hGDIPDll = 0
EndIf
Return True
EndFunc
Func _GDIPlus_Startup($sGDIPDLL = Default, $bRetDllHandle = False)
$__g_iGDIPRef += 1
If $__g_iGDIPRef > 1 Then Return True
If $sGDIPDLL = Default Then $sGDIPDLL = "gdiplus.dll"
$__g_hGDIPDll = DllOpen($sGDIPDLL)
If $__g_hGDIPDll = -1 Then
$__g_iGDIPRef = 0
Return SetError(1, 2, False)
EndIf
Local $sVer = FileGetVersion($sGDIPDLL)
$sVer = StringSplit($sVer, ".")
If $sVer[1] > 5 Then $__g_bGDIP_V1_0 = False
Local $tInput = DllStructCreate($tagGDIPSTARTUPINPUT)
Local $tToken = DllStructCreate("ulong_ptr Data")
DllStructSetData($tInput, "Version", 1)
Local $aResult = DllCall($__g_hGDIPDll, "int", "GdiplusStartup", "struct*", $tToken, "struct*", $tInput, "ptr", 0)
If @error Then Return SetError(@error, @extended, False)
If $aResult[0] Then Return SetError(10, $aResult[0], False)
$__g_iGDIPToken = DllStructGetData($tToken, "Data")
If $bRetDllHandle Then Return $__g_hGDIPDll
Return SetExtended($sVer[1], True)
EndFunc
Func __GDIPlus_ExtractFileExt($sFileName, $bNoDot = True)
Local $iIndex = __GDIPlus_LastDelimiter(".\:", $sFileName)
If($iIndex > 0) And(StringMid($sFileName, $iIndex, 1) = '.') Then
If $bNoDot Then
Return StringMid($sFileName, $iIndex + 1)
Else
Return StringMid($sFileName, $iIndex)
EndIf
Else
Return ""
EndIf
EndFunc
Func __GDIPlus_LastDelimiter($sDelimiters, $sString)
Local $sDelimiter, $iN
For $iI = 1 To StringLen($sDelimiters)
$sDelimiter = StringMid($sDelimiters, $iI, 1)
$iN = StringInStr($sString, $sDelimiter, 0, -1)
If $iN > 0 Then Return $iN
Next
EndFunc
Global $__g_iBMPFormat = $GDIP_PXF24RGB
Global $__g_iJPGQuality = 100
Global $__g_iTIFColorDepth = 24
Global $__g_iTIFCompression = $GDIP_EVTCOMPRESSIONLZW
Global Const $__SCREENCAPTURECONSTANT_SM_CXSCREEN = 0
Global Const $__SCREENCAPTURECONSTANT_SM_CYSCREEN = 1
Global Const $__SCREENCAPTURECONSTANT_SRCCOPY = 0x00CC0020
Func _ScreenCapture_Capture($sFileName = "", $iLeft = 0, $iTop = 0, $iRight = -1, $iBottom = -1, $bCursor = True)
Local $bRet = False
If $iRight = -1 Then $iRight = _WinAPI_GetSystemMetrics($__SCREENCAPTURECONSTANT_SM_CXSCREEN) - 1
If $iBottom = -1 Then $iBottom = _WinAPI_GetSystemMetrics($__SCREENCAPTURECONSTANT_SM_CYSCREEN) - 1
If $iRight < $iLeft Then Return SetError(-1, 0, $bRet)
If $iBottom < $iTop Then Return SetError(-2, 0, $bRet)
Local $iW =($iRight - $iLeft) + 1
Local $iH =($iBottom - $iTop) + 1
Local $hWnd = _WinAPI_GetDesktopWindow()
Local $hDDC = _WinAPI_GetDC($hWnd)
Local $hCDC = _WinAPI_CreateCompatibleDC($hDDC)
Local $hBMP = _WinAPI_CreateCompatibleBitmap($hDDC, $iW, $iH)
_WinAPI_SelectObject($hCDC, $hBMP)
_WinAPI_BitBlt($hCDC, 0, 0, $iW, $iH, $hDDC, $iLeft, $iTop, $__SCREENCAPTURECONSTANT_SRCCOPY)
If $bCursor Then
Local $aCursor = _WinAPI_GetCursorInfo()
If Not @error And $aCursor[1] Then
$bCursor = True
Local $hIcon = _WinAPI_CopyIcon($aCursor[2])
Local $aIcon = _WinAPI_GetIconInfo($hIcon)
If Not @error Then
_WinAPI_DeleteObject($aIcon[4])
If $aIcon[5] <> 0 Then _WinAPI_DeleteObject($aIcon[5])
_WinAPI_DrawIcon($hCDC, $aCursor[3] - $aIcon[2] - $iLeft, $aCursor[4] - $aIcon[3] - $iTop, $hIcon)
EndIf
_WinAPI_DestroyIcon($hIcon)
EndIf
EndIf
_WinAPI_ReleaseDC($hWnd, $hDDC)
_WinAPI_DeleteDC($hCDC)
If $sFileName = "" Then Return $hBMP
$bRet = _ScreenCapture_SaveImage($sFileName, $hBMP, True)
Return SetError(@error, @extended, $bRet)
EndFunc
Func _ScreenCapture_SaveImage($sFileName, $hBitmap, $bFreeBmp = True)
_GDIPlus_Startup()
If @error Then Return SetError(-1, -1, False)
Local $sExt = StringUpper(__GDIPlus_ExtractFileExt($sFileName))
Local $sCLSID = _GDIPlus_EncodersGetCLSID($sExt)
If $sCLSID = "" Then Return SetError(-2, -2, False)
Local $hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)
If @error Then Return SetError(-3, -3, False)
Local $tData, $tParams
Switch $sExt
Case "BMP"
Local $iX = _GDIPlus_ImageGetWidth($hImage)
Local $iY = _GDIPlus_ImageGetHeight($hImage)
Local $hClone = _GDIPlus_BitmapCloneArea($hImage, 0, 0, $iX, $iY, $__g_iBMPFormat)
_GDIPlus_ImageDispose($hImage)
$hImage = $hClone
Case "JPG", "JPEG"
$tParams = _GDIPlus_ParamInit(1)
$tData = DllStructCreate("int Quality")
DllStructSetData($tData, "Quality", $__g_iJPGQuality)
_GDIPlus_ParamAdd($tParams, $GDIP_EPGQUALITY, 1, $GDIP_EPTLONG, DllStructGetPtr($tData))
Case "TIF", "TIFF"
$tParams = _GDIPlus_ParamInit(2)
$tData = DllStructCreate("int ColorDepth;int Compression")
DllStructSetData($tData, "ColorDepth", $__g_iTIFColorDepth)
DllStructSetData($tData, "Compression", $__g_iTIFCompression)
_GDIPlus_ParamAdd($tParams, $GDIP_EPGCOLORDEPTH, 1, $GDIP_EPTLONG, DllStructGetPtr($tData, "ColorDepth"))
_GDIPlus_ParamAdd($tParams, $GDIP_EPGCOMPRESSION, 1, $GDIP_EPTLONG, DllStructGetPtr($tData, "Compression"))
EndSwitch
Local $pParams = 0
If IsDllStruct($tParams) Then $pParams = $tParams
Local $bRet = _GDIPlus_ImageSaveToFileEx($hImage, $sFileName, $sCLSID, $pParams)
_GDIPlus_ImageDispose($hImage)
If $bFreeBmp Then _WinAPI_DeleteObject($hBitmap)
_GDIPlus_Shutdown()
Return SetError($bRet = False, 0, $bRet)
EndFunc
Global Const $BS_LEFT = 0x0100
Global Const $BS_PUSHLIKE = 0x1000
Global Const $BS_FLAT = 0x8000
Global Const $GUI_SS_DEFAULT_GROUP = 0
Global Const $ES_CENTER = 1
Global Const $ES_LOWERCASE = 16
Global Const $ES_PASSWORD = 32
Global Const $ES_AUTOVSCROLL = 64
Global Const $ES_AUTOHSCROLL = 128
Global Const $ES_NOHIDESEL = 256
Global Const $ES_READONLY = 2048
Global Const $ES_WANTRETURN = 4096
Global Const $EM_REPLACESEL = 0xC2
Global Const $EM_SETSEL = 0xB1
Global Const $GUI_SS_DEFAULT_INPUT = 0x00000080
Global Const $GUI_EVENT_CLOSE = -3
Global Const $GUI_CHECKED = 1
Global Const $GUI_UNCHECKED = 4
Global Const $GUI_SHOW = 16
Global Const $TCS_EX_FLATSEPARATORS = 0x00000001
Global Const $__EDITCONSTANT_WM_GETTEXTLENGTH = 0x000E
Func _GUICtrlEdit_AppendText($hWnd, $sText)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $iLength = _GUICtrlEdit_GetTextLen($hWnd)
_GUICtrlEdit_SetSel($hWnd, $iLength, $iLength)
_SendMessage($hWnd, $EM_REPLACESEL, True, $sText, 0, "wparam", "wstr")
EndFunc
Func _GUICtrlEdit_GetTextLen($hWnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Return _SendMessage($hWnd, $__EDITCONSTANT_WM_GETTEXTLENGTH)
EndFunc
Func _GUICtrlEdit_SetSel($hWnd, $iStart, $iEnd)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
_SendMessage($hWnd, $EM_SETSEL, $iStart, $iEnd)
EndFunc
Global Const $DMW_SHORTNAME = 1
Global Const $DMW_LOCALE_LONGNAME = 2
Global Const $LOCALE_SDATE = 0x001D
Global Const $LOCALE_STIME = 0x001E
Global Const $LOCALE_SSHORTDATE = 0x001F
Global Const $LOCALE_SLONGDATE = 0x0020
Global Const $LOCALE_STIMEFORMAT = 0x1003
Global Const $LOCALE_S1159 = 0x0028
Global Const $LOCALE_S2359 = 0x0029
Global Const $LOCALE_INVARIANT = 0x007F
Global Const $LOCALE_USER_DEFAULT = 0x0400
Func _WinAPI_GetDateFormat($iLCID = 0, $tSYSTEMTIME = 0, $iFlags = 0, $sFormat = '')
If Not $iLCID Then $iLCID = 0x0400
Local $sTypeOfFormat = 'wstr'
If Not StringStripWS($sFormat, $STR_STRIPLEADING + $STR_STRIPTRAILING) Then
$sTypeOfFormat = 'ptr'
$sFormat = 0
EndIf
Local $aRet = DllCall('kernel32.dll', 'int', 'GetDateFormatW', 'dword', $iLCID, 'dword', $iFlags, 'struct*', $tSYSTEMTIME, $sTypeOfFormat, $sFormat, 'wstr', '', 'int', 2048)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, '')
Return $aRet[5]
EndFunc
Func _WinAPI_GetLocaleInfo($iLCID, $iType)
Local $aRet = DllCall('kernel32.dll', 'int', 'GetLocaleInfoW', 'dword', $iLCID, 'dword', $iType, 'wstr', '', 'int', 2048)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, '')
Return $aRet[3]
EndFunc
Func _DateDayOfWeek($iDayNum, $iFormat = Default)
Local Const $MONDAY_IS_NO1 = 128
If $iFormat = Default Then $iFormat = 0
$iDayNum = Int($iDayNum)
If $iDayNum < 1 Or $iDayNum > 7 Then Return SetError(1, 0, "")
Local $tSYSTEMTIME = DllStructCreate($tagSYSTEMTIME)
DllStructSetData($tSYSTEMTIME, "Year", BitAND($iFormat, $MONDAY_IS_NO1) ? 2007 : 2006)
DllStructSetData($tSYSTEMTIME, "Month", 1)
DllStructSetData($tSYSTEMTIME, "Day", $iDayNum)
Return _WinAPI_GetDateFormat(BitAND($iFormat, $DMW_LOCALE_LONGNAME) ? $LOCALE_USER_DEFAULT : $LOCALE_INVARIANT, $tSYSTEMTIME, 0, BitAND($iFormat, $DMW_SHORTNAME) ? "ddd" : "dddd")
EndFunc
Func _DateIsLeapYear($iYear)
If StringIsInt($iYear) Then
Select
Case Mod($iYear, 4) = 0 And Mod($iYear, 100) <> 0
Return 1
Case Mod($iYear, 400) = 0
Return 1
Case Else
Return 0
EndSelect
EndIf
Return SetError(1, 0, 0)
EndFunc
Func __DateIsMonth($iNumber)
$iNumber = Int($iNumber)
Return $iNumber >= 1 And $iNumber <= 12
EndFunc
Func _DateIsValid($sDate)
Local $asDatePart[4], $asTimePart[4]
_DateTimeSplit($sDate, $asDatePart, $asTimePart)
If Not StringIsInt($asDatePart[1]) Then Return 0
If Not StringIsInt($asDatePart[2]) Then Return 0
If Not StringIsInt($asDatePart[3]) Then Return 0
$asDatePart[1] = Int($asDatePart[1])
$asDatePart[2] = Int($asDatePart[2])
$asDatePart[3] = Int($asDatePart[3])
Local $iNumDays = _DaysInMonth($asDatePart[1])
If $asDatePart[1] < 1000 Or $asDatePart[1] > 2999 Then Return 0
If $asDatePart[2] < 1 Or $asDatePart[2] > 12 Then Return 0
If $asDatePart[3] < 1 Or $asDatePart[3] > $iNumDays[$asDatePart[2]] Then Return 0
If $asTimePart[0] < 1 Then Return 1
If $asTimePart[0] < 2 Then Return 0
If $asTimePart[0] = 2 Then $asTimePart[3] = "00"
If Not StringIsInt($asTimePart[1]) Then Return 0
If Not StringIsInt($asTimePart[2]) Then Return 0
If Not StringIsInt($asTimePart[3]) Then Return 0
$asTimePart[1] = Int($asTimePart[1])
$asTimePart[2] = Int($asTimePart[2])
$asTimePart[3] = Int($asTimePart[3])
If $asTimePart[1] < 0 Or $asTimePart[1] > 23 Then Return 0
If $asTimePart[2] < 0 Or $asTimePart[2] > 59 Then Return 0
If $asTimePart[3] < 0 Or $asTimePart[3] > 59 Then Return 0
Return 1
EndFunc
Func _DateTimeFormat($sDate, $sType)
Local $asDatePart[4], $asTimePart[4]
Local $sTempDate = "", $sTempTime = ""
Local $sAM, $sPM, $sTempString = ""
If Not _DateIsValid($sDate) Then
Return SetError(1, 0, "")
EndIf
If $sType < 0 Or $sType > 5 Or Not IsInt($sType) Then
Return SetError(2, 0, "")
EndIf
_DateTimeSplit($sDate, $asDatePart, $asTimePart)
Switch $sType
Case 0
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_SSHORTDATE)
If Not @error And Not($sTempString = '') Then
$sTempDate = $sTempString
Else
$sTempDate = "M/d/yyyy"
EndIf
If $asTimePart[0] > 1 Then
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_STIMEFORMAT)
If Not @error And Not($sTempString = '') Then
$sTempTime = $sTempString
Else
$sTempTime = "h:mm:ss tt"
EndIf
EndIf
Case 1
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_SLONGDATE)
If Not @error And Not($sTempString = '') Then
$sTempDate = $sTempString
Else
$sTempDate = "dddd, MMMM dd, yyyy"
EndIf
Case 2
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_SSHORTDATE)
If Not @error And Not($sTempString = '') Then
$sTempDate = $sTempString
Else
$sTempDate = "M/d/yyyy"
EndIf
Case 3
If $asTimePart[0] > 1 Then
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_STIMEFORMAT)
If Not @error And Not($sTempString = '') Then
$sTempTime = $sTempString
Else
$sTempTime = "h:mm:ss tt"
EndIf
EndIf
Case 4
If $asTimePart[0] > 1 Then
$sTempTime = "hh:mm"
EndIf
Case 5
If $asTimePart[0] > 1 Then
$sTempTime = "hh:mm:ss"
EndIf
EndSwitch
If $sTempDate <> "" Then
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_SDATE)
If Not @error And Not($sTempString = '') Then
$sTempDate = StringReplace($sTempDate, "/", $sTempString)
EndIf
Local $iWday = _DateToDayOfWeek($asDatePart[1], $asDatePart[2], $asDatePart[3])
$asDatePart[3] = StringRight("0" & $asDatePart[3], 2)
$asDatePart[2] = StringRight("0" & $asDatePart[2], 2)
$sTempDate = StringReplace($sTempDate, "d", "@")
$sTempDate = StringReplace($sTempDate, "m", "#")
$sTempDate = StringReplace($sTempDate, "y", "&")
$sTempDate = StringReplace($sTempDate, "@@@@", _DateDayOfWeek($iWday, 0))
$sTempDate = StringReplace($sTempDate, "@@@", _DateDayOfWeek($iWday, 1))
$sTempDate = StringReplace($sTempDate, "@@", $asDatePart[3])
$sTempDate = StringReplace($sTempDate, "@", StringReplace(StringLeft($asDatePart[3], 1), "0", "") & StringRight($asDatePart[3], 1))
$sTempDate = StringReplace($sTempDate, "####", _DateToMonth($asDatePart[2], 0))
$sTempDate = StringReplace($sTempDate, "###", _DateToMonth($asDatePart[2], 1))
$sTempDate = StringReplace($sTempDate, "##", $asDatePart[2])
$sTempDate = StringReplace($sTempDate, "#", StringReplace(StringLeft($asDatePart[2], 1), "0", "") & StringRight($asDatePart[2], 1))
$sTempDate = StringReplace($sTempDate, "&&&&", $asDatePart[1])
$sTempDate = StringReplace($sTempDate, "&&", StringRight($asDatePart[1], 2))
EndIf
If $sTempTime <> "" Then
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_S1159)
If Not @error And Not($sTempString = '') Then
$sAM = $sTempString
Else
$sAM = "AM"
EndIf
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_S2359)
If Not @error And Not($sTempString = '') Then
$sPM = $sTempString
Else
$sPM = "PM"
EndIf
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_STIME)
If Not @error And Not($sTempString = '') Then
$sTempTime = StringReplace($sTempTime, ":", $sTempString)
EndIf
If StringInStr($sTempTime, "tt") Then
If $asTimePart[1] < 12 Then
$sTempTime = StringReplace($sTempTime, "tt", $sAM)
If $asTimePart[1] = 0 Then $asTimePart[1] = 12
Else
$sTempTime = StringReplace($sTempTime, "tt", $sPM)
If $asTimePart[1] > 12 Then $asTimePart[1] = $asTimePart[1] - 12
EndIf
EndIf
$asTimePart[1] = StringRight("0" & $asTimePart[1], 2)
$asTimePart[2] = StringRight("0" & $asTimePart[2], 2)
$asTimePart[3] = StringRight("0" & $asTimePart[3], 2)
$sTempTime = StringReplace($sTempTime, "hh", StringFormat("%02d", $asTimePart[1]))
$sTempTime = StringReplace($sTempTime, "h", StringReplace(StringLeft($asTimePart[1], 1), "0", "") & StringRight($asTimePart[1], 1))
$sTempTime = StringReplace($sTempTime, "mm", StringFormat("%02d", $asTimePart[2]))
$sTempTime = StringReplace($sTempTime, "ss", StringFormat("%02d", $asTimePart[3]))
$sTempDate = StringStripWS($sTempDate & " " & $sTempTime, $STR_STRIPLEADING + $STR_STRIPTRAILING)
EndIf
Return $sTempDate
EndFunc
Func _DateTimeSplit($sDate, ByRef $aDatePart, ByRef $iTimePart)
Local $sDateTime = StringSplit($sDate, " T")
If $sDateTime[0] > 0 Then $aDatePart = StringSplit($sDateTime[1], "/-.")
If $sDateTime[0] > 1 Then
$iTimePart = StringSplit($sDateTime[2], ":")
If UBound($iTimePart) < 4 Then ReDim $iTimePart[4]
Else
Dim $iTimePart[4]
EndIf
If UBound($aDatePart) < 4 Then ReDim $aDatePart[4]
For $x = 1 To 3
If StringIsInt($aDatePart[$x]) Then
$aDatePart[$x] = Int($aDatePart[$x])
Else
$aDatePart[$x] = -1
EndIf
If StringIsInt($iTimePart[$x]) Then
$iTimePart[$x] = Int($iTimePart[$x])
Else
$iTimePart[$x] = 0
EndIf
Next
Return 1
EndFunc
Func _DateToDayOfWeek($iYear, $iMonth, $iDay)
If Not _DateIsValid($iYear & "/" & $iMonth & "/" & $iDay) Then
Return SetError(1, 0, "")
EndIf
Local $i_FactorA = Int((14 - $iMonth) / 12)
Local $i_FactorY = $iYear - $i_FactorA
Local $i_FactorM = $iMonth +(12 * $i_FactorA) - 2
Local $i_FactorD = Mod($iDay + $i_FactorY + Int($i_FactorY / 4) - Int($i_FactorY / 100) + Int($i_FactorY / 400) + Int((31 * $i_FactorM) / 12), 7)
Return $i_FactorD + 1
EndFunc
Func _DateToDayValue($iYear, $iMonth, $iDay)
If Not _DateIsValid(StringFormat("%04d/%02d/%02d", $iYear, $iMonth, $iDay)) Then
Return SetError(1, 0, "")
EndIf
If $iMonth < 3 Then
$iMonth = $iMonth + 12
$iYear = $iYear - 1
EndIf
Local $i_FactorA = Int($iYear / 100)
Local $i_FactorB = Int($i_FactorA / 4)
Local $i_FactorC = 2 - $i_FactorA + $i_FactorB
Local $i_FactorE = Int(1461 *($iYear + 4716) / 4)
Local $i_FactorF = Int(153 *($iMonth + 1) / 5)
Local $iJulianDate = $i_FactorC + $iDay + $i_FactorE + $i_FactorF - 1524.5
Return $iJulianDate
EndFunc
Func _DateToMonth($iMonNum, $iFormat = Default)
If $iFormat = Default Then $iFormat = 0
$iMonNum = Int($iMonNum)
If Not __DateIsMonth($iMonNum) Then Return SetError(1, 0, "")
Local $tSYSTEMTIME = DllStructCreate($tagSYSTEMTIME)
DllStructSetData($tSYSTEMTIME, "Year", @YEAR)
DllStructSetData($tSYSTEMTIME, "Month", $iMonNum)
DllStructSetData($tSYSTEMTIME, "Day", 1)
Return _WinAPI_GetDateFormat(BitAND($iFormat, $DMW_LOCALE_LONGNAME) ? $LOCALE_USER_DEFAULT : $LOCALE_INVARIANT, $tSYSTEMTIME, 0, BitAND($iFormat, $DMW_SHORTNAME) ? "MMM" : "MMMM")
EndFunc
Func _NowTime($sType = 3)
If $sType < 3 Or $sType > 5 Then $sType = 3
Return _DateTimeFormat(@YEAR & "/" & @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC, $sType)
EndFunc
Func _TicksToTime($iTicks, ByRef $iHours, ByRef $iMins, ByRef $iSecs)
If Number($iTicks) > 0 Then
$iTicks = Int($iTicks / 1000)
$iHours = Int($iTicks / 3600)
$iTicks = Mod($iTicks, 3600)
$iMins = Int($iTicks / 60)
$iSecs = Mod($iTicks, 60)
Return 1
ElseIf Number($iTicks) = 0 Then
$iHours = 0
$iTicks = 0
$iMins = 0
$iSecs = 0
Return 1
Else
Return SetError(1, 0, 0)
EndIf
EndFunc
Func _DaysInMonth($iYear)
Local $aDays = [12, 31,(_DateIsLeapYear($iYear) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
Return $aDays
EndFunc
Func _Singleton($sOccurrenceName, $iFlag = 0)
Local Const $ERROR_ALREADY_EXISTS = 183
Local Const $SECURITY_DESCRIPTOR_REVISION = 1
Local $tSecurityAttributes = 0
If BitAND($iFlag, 2) Then
Local $tSecurityDescriptor = DllStructCreate("byte;byte;word;ptr[4]")
Local $aRet = DllCall("advapi32.dll", "bool", "InitializeSecurityDescriptor", "struct*", $tSecurityDescriptor, "dword", $SECURITY_DESCRIPTOR_REVISION)
If @error Then Return SetError(@error, @extended, 0)
If $aRet[0] Then
$aRet = DllCall("advapi32.dll", "bool", "SetSecurityDescriptorDacl", "struct*", $tSecurityDescriptor, "bool", 1, "ptr", 0, "bool", 0)
If @error Then Return SetError(@error, @extended, 0)
If $aRet[0] Then
$tSecurityAttributes = DllStructCreate($tagSECURITY_ATTRIBUTES)
DllStructSetData($tSecurityAttributes, 1, DllStructGetSize($tSecurityAttributes))
DllStructSetData($tSecurityAttributes, 2, DllStructGetPtr($tSecurityDescriptor))
DllStructSetData($tSecurityAttributes, 3, 0)
EndIf
EndIf
EndIf
Local $aHandle = DllCall("kernel32.dll", "handle", "CreateMutexW", "struct*", $tSecurityAttributes, "bool", 1, "wstr", $sOccurrenceName)
If @error Then Return SetError(@error, @extended, 0)
Local $aLastError = DllCall("kernel32.dll", "dword", "GetLastError")
If @error Then Return SetError(@error, @extended, 0)
If $aLastError[0] = $ERROR_ALREADY_EXISTS Then
If BitAND($iFlag, 1) Then
DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $aHandle[0])
If @error Then Return SetError(@error, @extended, 0)
Return SetError($aLastError[0], $aLastError[0], 0)
Else
Exit -1
EndIf
EndIf
Return $aHandle[0]
EndFunc
Func _IsPressed($sHexKey, $vDLL = 'user32.dll')
Local $a_R = DllCall($vDLL, "short", "GetAsyncKeyState", "int", '0x' & $sHexKey)
If @error Then Return SetError(@error, @extended, False)
Return BitAND($a_R[0], 0x8000) <> 0
EndFunc
Func _ArrayToString(Const ByRef $aArray, $sDelim_Col = "|", $iStart_Row = -1, $iEnd_Row = -1, $sDelim_Row = @CRLF, $iStart_Col = -1, $iEnd_Col = -1)
If $sDelim_Col = Default Then $sDelim_Col = "|"
If $sDelim_Row = Default Then $sDelim_Row = @CRLF
If $iStart_Row = Default Then $iStart_Row = -1
If $iEnd_Row = Default Then $iEnd_Row = -1
If $iStart_Col = Default Then $iStart_Col = -1
If $iEnd_Col = Default Then $iEnd_Col = -1
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS) - 1
If $iStart_Row = -1 Then $iStart_Row = 0
If $iEnd_Row = -1 Then $iEnd_Row = $iDim_1
If $iStart_Row < -1 Or $iEnd_Row < -1 Then Return SetError(3, 0, -1)
If $iStart_Row > $iDim_1 Or $iEnd_Row > $iDim_1 Then Return SetError(3, 0, "")
If $iStart_Row > $iEnd_Row Then Return SetError(4, 0, -1)
Local $sRet = ""
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
For $i = $iStart_Row To $iEnd_Row
$sRet &= $aArray[$i] & $sDelim_Col
Next
Return StringTrimRight($sRet, StringLen($sDelim_Col))
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS) - 1
If $iStart_Col = -1 Then $iStart_Col = 0
If $iEnd_Col = -1 Then $iEnd_Col = $iDim_2
If $iStart_Col < -1 Or $iEnd_Col < -1 Then Return SetError(5, 0, -1)
If $iStart_Col > $iDim_2 Or $iEnd_Col > $iDim_2 Then Return SetError(5, 0, -1)
If $iStart_Col > $iEnd_Col Then Return SetError(6, 0, -1)
For $i = $iStart_Row To $iEnd_Row
For $j = $iStart_Col To $iEnd_Col
$sRet &= $aArray[$i][$j] & $sDelim_Col
Next
$sRet = StringTrimRight($sRet, StringLen($sDelim_Col)) & $sDelim_Row
Next
Return StringTrimRight($sRet, StringLen($sDelim_Row))
Case Else
Return SetError(2, 0, -1)
EndSwitch
Return 1
EndFunc
Func _FileReadToArray($sFilePath, ByRef $vReturn, $iFlags = $FRTA_COUNT, $sDelimiter = "")
$vReturn = 0
If $iFlags = Default Then $iFlags = $FRTA_COUNT
If $sDelimiter = Default Then $sDelimiter = ""
Local $bExpand = True
If BitAND($iFlags, $FRTA_INTARRAYS) Then
$bExpand = False
$iFlags -= $FRTA_INTARRAYS
EndIf
Local $iEntire = $STR_CHRSPLIT
If BitAND($iFlags, $FRTA_ENTIRESPLIT) Then
$iEntire = $STR_ENTIRESPLIT
$iFlags -= $FRTA_ENTIRESPLIT
EndIf
Local $iNoCount = 0
If $iFlags <> $FRTA_COUNT Then
$iFlags = $FRTA_NOCOUNT
$iNoCount = $STR_NOCOUNT
EndIf
If $sDelimiter Then
Local $aLines = FileReadToArray($sFilePath)
If @error Then Return SetError(@error, 0, 0)
Local $iDim_1 = UBound($aLines) + $iFlags
If $bExpand Then
Local $iDim_2 = UBound(StringSplit($aLines[0], $sDelimiter, $iEntire + $STR_NOCOUNT))
Local $aTemp_Array[$iDim_1][$iDim_2]
Local $iFields, $aSplit
For $i = 0 To $iDim_1 - $iFlags - 1
$aSplit = StringSplit($aLines[$i], $sDelimiter, $iEntire + $STR_NOCOUNT)
$iFields = UBound($aSplit)
If $iFields <> $iDim_2 Then
Return SetError(3, 0, 0)
EndIf
For $j = 0 To $iFields - 1
$aTemp_Array[$i + $iFlags][$j] = $aSplit[$j]
Next
Next
If $iDim_2 < 2 Then Return SetError(4, 0, 0)
If $iFlags Then
$aTemp_Array[0][0] = $iDim_1 - $iFlags
$aTemp_Array[0][1] = $iDim_2
EndIf
Else
Local $aTemp_Array[$iDim_1]
For $i = 0 To $iDim_1 - $iFlags - 1
$aTemp_Array[$i + $iFlags] = StringSplit($aLines[$i], $sDelimiter, $iEntire + $iNoCount)
Next
If $iFlags Then
$aTemp_Array[0] = $iDim_1 - $iFlags
EndIf
EndIf
$vReturn = $aTemp_Array
Else
If $iFlags Then
Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
If $hFileOpen = -1 Then Return SetError(1, 0, 0)
Local $sFileRead = FileRead($hFileOpen)
FileClose($hFileOpen)
If StringLen($sFileRead) Then
$vReturn = StringRegExp(@LF & $sFileRead, "(?|(\N+)\z|(\N*)(?:\R))", 3)
$vReturn[0] = UBound($vReturn) - 1
Else
Return SetError(2, 0, 0)
EndIf
Else
$vReturn = FileReadToArray($sFilePath)
If @error Then
$vReturn = 0
Return SetError(@error, 0, 0)
EndIf
EndIf
EndIf
Return 1
EndFunc
Local $expdate
Dec_MagicNumber()
Dec_All()
If _Singleton("VideoViewingAutomator", 1) = 0 Then
MsgBox($MB_SYSTEMMODAL, "Warning", "An occurrence of the program is already running. Cannot run two instances of the same program at the same time. Close the previous instance of the program and try again! :) ",120)
Exit
EndIf
If(Floor(_DateToDayValue(@YEAR, @MON, @MDAY)) > $expdate) Then
MsgBox(0, "Error", "License has expired. Please Contact the developer at rohansawantct83@gmail.com")
Exit
EndIf
Func Dec_MagicNumber()
Global $expdate = Floor(_DateToDayValue("2017", "3", "1"))
Global $g_sAppFullTitle = "Video Viewing Automator"
Global $SessionStartTime = 1130
Global $check_var=0x000000
Global $check_var2=0xCC181E
Global $CheckSiteLoad_Var2=0x222222
Global $sSavedPath="Configurations\Default\"
Global $1Hour=3600
Global $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")
EndFunc
Func Dec_Coordinates()
ToolTip2("Declaring Coordinates...")
Global $LoginTextField = LocationRead("LoginTextField",1)
Global $ClearLoginBtn = LocationRead("ClearLoginBtn",1)
Global $OpenWorkspaceBtn = LocationRead("OpenWorkspaceBtn",1)
Global $VideoViewerCloseBtn = LocationRead("VideoViewerCloseBtn",1)
Global $DisplayTimeUpperLeft = LocationRead("DisplayTimeUpperLeft",1)
Global $DisplayTimeLowerRight = LocationRead("DisplayTimeLowerRight",1)
ToolTip2("Done!")
ToolTip("")
EndFunc
Func Dec_All()
Global $hardware_Current_Config, $hardware_Current_Config, $Paused, $Private_V_Ctr,$TarToday,$HusLim,$Runtime_Var21
Global $Runtime_Var22,$Runtime_Var23,$hSplash,$GLoginID
Global $GPsh_AftCyc,$GPsh_Tk1,$GPsh_Tk2,$GPsh_Tk3,$GPsh_Tk4,$Gautostartcheck,$RunTime_Var, $Runtime_Var2,$Runtime_Var3, $Runtime
Global $Runtime_Save,$LastCycle_Counter, $ChkBuff_Counter1,$ChkBuff_Var1, $ChkBuff_Var2,$Tempc,$SlpMng_TElpHour
Global $FileName_Session=String(@HOUR&"-"& @MIN&" "&@MDAY &"-"& @MON &"-"& @YEAR)
Global $KeepWatching=1, $SuccessCounter=0, $SuccessfulViews=$SuccessCounter,$AttemptedViews=0, $StoredViews=0, $TotalViews1=0
Global $var2=0,$var3=0,$Video_Playing_Check=0,$CheckYouTubeLoaded_Counter=0
Global $CIAP_Var2_Counter=0, $CIAP_Error=0, $CIAP_Var1=0, $CIAP_Var3=0, $CIAP_FuncCounter=0, $CIAP_CounterLimit=0, $GCIAP=0, $CIAP_TimeLimit=0, $CIAP_Config
Global $Restart_Counter=0, $Log_Counter=0
Global $RunTime_Counter=0, $Runtime_Cycle=0, $Runtime_Raw=0
Global $ChkBuff_Var3=0, $ChkBuff_Var4=0, $LoginTimeErr_Counter=0, $VideoLoading_Errors=0, $CloseAllOtherTabs_Counter=0
Global $VideoViewer_LoadErr=0,$CheckViewer_Counter=0, $CheckVideoViewerLoaded=0, $cCounter_GUI=0, $cCounterG=0
Global $SiteLoaded_Check=0,$SiteLoad_Counter=0,$CheckSiteLoad_Click=0,$iLastCallHr=@HOUR,$iHours_LastC=0,$WCSV_Ctr=0
Global $Runtime_Cycle_Avg_Counter=0,$Runtime_Cycle_Avg_Sum=0,$Runtime_Cycle_Avg=0,$cCounter_sent=0,$iCSV_ctr=0,$iViews_ThisHour=0
Global $Session_Expired_Counter=0,$CheckIfZero_Counter=0, $ChkZeroCtr=0, $iWCSV_i=0,$TarHours,$WCSV[100][25],$iWatchRedirect=0
Global $iFirst_Run=0,$iS_Time=0, $iS_TimeDisp=0, $cCounter_push=0, $itTimes=0,$iWriteTotal=0, $iStillWatch=0, $iLoadOther=0,$Brn_Ctr=0
Global $CustomerID="001"
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
Global $hSplash
Global $hProgressSplash = _Splash("Loading...")
GUICtrlSetData($hProgressSplash, "Declaring Variables...")
AutoItSetOption('MouseCoordMode',0)
AutoItSetOption("SendKeyDelay", 50)
Opt("WinTitleMatchMode",2)
HotKeySet("{END}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
GUICtrlSetData($hProgressSplash, "Loading GUI...")
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
GUICtrlSetCursor(-1, 0)
$Password = GUICtrlCreateInput("", 348, 403, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
$LogID = GUICtrlCreateLabel("LogInID", 288, 384, 49, 17)
$Pass = GUICtrlCreateLabel("Password", 288, 408, 58, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetCursor(-1, 0)
$Group2 = GUICtrlCreateGroup("Push Updates", 4, 371, 150, 137, BitOR($GUI_SS_DEFAULT_GROUP,$BS_LEFT,$BS_FLAT))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Psh_Tk1 = GUICtrlCreateInput("", 85, 403, 65, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
$Label6 = GUICtrlCreateLabel("Token", 8, 408, 40, 17)
$Psh_Chk = GUICtrlCreateCheckbox("Enable", 8, 485, 65, 17)
GUICtrlSetCursor(-1, 0)
$Label18 = GUICtrlCreateLabel("Send After Cycles", 8, 387, 105, 17)
$Psh_AftCyc = GUICtrlCreateInput("", 116, 383, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
$Label45 = GUICtrlCreateLabel("Token", 8, 425, 40, 17)
$Psh_Tk2 = GUICtrlCreateInput("", 85, 422, 65, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
$Psh_Tk3 = GUICtrlCreateInput("", 85, 441, 65, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
$Psh_Tk4 = GUICtrlCreateInput("", 85, 459, 65, 21, BitOR($GUI_SS_DEFAULT_INPUT,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
$Label46 = GUICtrlCreateLabel("Token", 8, 442, 40, 17)
$Label47 = GUICtrlCreateLabel("Token", 7, 459, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetCursor(-1, 0)
$AutoStart = GUICtrlCreateGroup("Misc.", 157, 371, 126, 137)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label22 = GUICtrlCreateLabel("", 167, 391, 4, 4)
$autostartcheck = GUICtrlCreateCheckbox("Enable AutoStart  ", 162, 386, 113, 17)
GUICtrlSetCursor(-1, 0)
$Label28 = GUICtrlCreateLabel("CIAP Limit", 197, 408, 62, 17)
$CIAP = GUICtrlCreateInput("", 162, 406, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
$Label23 = GUICtrlCreateLabel("CustomerID", 197, 430, 69, 17)
$NickName_Edit = GUICtrlCreateInput("", 162, 428, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
$Label8 = GUICtrlCreateLabel(" Zero Limit", 197, 450, 64, 17)
$Z_Lim = GUICtrlCreateInput("", 162, 449, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
$Label14 = GUICtrlCreateLabel("Load Limit", 197, 479, 62, 17)
$L_Lim = GUICtrlCreateInput("", 162, 473, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group13 = GUICtrlCreateGroup("", 5, 26, 390, 345, BitOR($GUI_SS_DEFAULT_GROUP,$BS_LEFT,$BS_FLAT))
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Group3 = GUICtrlCreateGroup("Setting Scheme 1", 13, 34, 121, 313)
$S1_Chk = GUICtrlCreateCheckbox("Enable", 18, 321, 65, 17)
GUICtrlSetCursor(-1, 0)
$Group7 = GUICtrlCreateGroup("Hustle", 21, 128, 105, 105)
$S1_HusChk = GUICtrlCreateCheckbox("Enable", 28, 212, 65, 17)
GUICtrlSetCursor(-1, 0)
$Label30 = GUICtrlCreateLabel("Limit", 31, 144, 30, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S1_HusLim = GUICtrlCreateInput("000", 73, 142, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label31 = GUICtrlCreateLabel("Before", 31, 169, 41, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S1_HusBef = GUICtrlCreateInput("000", 73, 166, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label59 = GUICtrlCreateLabel("Thres.", 31, 193, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S1_HusThres = GUICtrlCreateInput("000", 73, 188, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group8 = GUICtrlCreateGroup("Target", 21, 47, 105, 81)
$Label19 = GUICtrlCreateLabel("Today", 30, 62, 39, 17)
$S1_TarToday = GUICtrlCreateInput("000", 80, 60, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label20 = GUICtrlCreateLabel("In Hours", 30, 87, 52, 17)
GUICtrlSetFont(-1, 1, 800, 0, "MS Sans Serif")
$S1_TarHours = GUICtrlCreateInput("000", 81, 82, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$S1_TarChk = GUICtrlCreateCheckbox("Enable", 27, 107, 65, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group9 = GUICtrlCreateGroup("Randomization", 21, 234, 105, 81)
$Label24 = GUICtrlCreateLabel("Target", 27, 252, 41, 17)
$S1_RandTar = GUICtrlCreateInput("000", 79, 249, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label29 = GUICtrlCreateLabel("Hustle", 27, 277, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S1_RandHus = GUICtrlCreateInput("000", 79, 272, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$S1_RandChk = GUICtrlCreateCheckbox("Enable", 25, 294, 65, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group15 = GUICtrlCreateGroup("Setting Scheme 1", 138, 40, 121, 305)
$S2_Chk = GUICtrlCreateCheckbox("Enable", 143, 327, 65, 17)
GUICtrlSetCursor(-1, 0)
$Group16 = GUICtrlCreateGroup("Hustle", 146, 134, 105, 105)
$S2_HusChk = GUICtrlCreateCheckbox("Enable", 153, 218, 65, 17)
GUICtrlSetCursor(-1, 0)
$Label33 = GUICtrlCreateLabel("Limit", 156, 150, 30, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S2_HusLim = GUICtrlCreateInput("000", 198, 148, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label34 = GUICtrlCreateLabel("Before", 156, 175, 41, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S2_HusBef = GUICtrlCreateInput("000", 198, 172, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label60 = GUICtrlCreateLabel("Thres.", 156, 199, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S2_HusThres = GUICtrlCreateInput("000", 198, 194, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group17 = GUICtrlCreateGroup("Target", 146, 53, 105, 81)
$Label35 = GUICtrlCreateLabel("Today", 155, 68, 39, 17)
$S2_TarToday = GUICtrlCreateInput("000", 205, 66, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label36 = GUICtrlCreateLabel("In Hours", 155, 93, 52, 17)
GUICtrlSetFont(-1, 1, 800, 0, "MS Sans Serif")
$S2_TarHours = GUICtrlCreateInput("000", 206, 88, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$S2_TarChk = GUICtrlCreateCheckbox("Enable", 152, 113, 65, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group18 = GUICtrlCreateGroup("Randomization", 146, 240, 105, 81)
$Label37 = GUICtrlCreateLabel("Target", 152, 258, 41, 17)
$S2_RandTar = GUICtrlCreateInput("000", 204, 255, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label38 = GUICtrlCreateLabel("Hustle", 152, 283, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S2_RandHus = GUICtrlCreateInput("000", 204, 278, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$S2_RandChk = GUICtrlCreateCheckbox("Enable", 150, 300, 65, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group19 = GUICtrlCreateGroup("Setting Scheme 1", 264, 40, 121, 305)
$Group20 = GUICtrlCreateGroup("Hustle", 272, 134, 105, 105)
$S3_HusChk = GUICtrlCreateCheckbox("Enable", 279, 218, 65, 17)
GUICtrlSetCursor(-1, 0)
$Label39 = GUICtrlCreateLabel("Limit", 282, 150, 30, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S3_HusLim = GUICtrlCreateInput("000", 324, 148, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label40 = GUICtrlCreateLabel("Before", 282, 175, 41, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S3_HusBef = GUICtrlCreateInput("000", 324, 172, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label61 = GUICtrlCreateLabel("Thres.", 282, 199, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S3_HusThres = GUICtrlCreateInput("000", 324, 194, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group21 = GUICtrlCreateGroup("Target", 272, 53, 105, 81)
$Label41 = GUICtrlCreateLabel("Today", 281, 68, 39, 17)
$S3_TarToday = GUICtrlCreateInput("000", 331, 66, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label42 = GUICtrlCreateLabel("In Hours", 281, 93, 52, 17)
GUICtrlSetFont(-1, 1, 800, 0, "MS Sans Serif")
$S3_TarHours = GUICtrlCreateInput("000", 332, 88, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$S3_TarChk = GUICtrlCreateCheckbox("Enable", 278, 113, 65, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group22 = GUICtrlCreateGroup("Randomization", 272, 240, 105, 81)
$Label43 = GUICtrlCreateLabel("Target", 278, 258, 41, 17)
$S3_RandTar = GUICtrlCreateInput("000", 330, 255, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label44 = GUICtrlCreateLabel("Hustle", 278, 283, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$S3_RandHus = GUICtrlCreateInput("000", 330, 278, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$S3_RandChk = GUICtrlCreateCheckbox("Enable", 276, 300, 65, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$S3_Chk = GUICtrlCreateCheckbox("Enable", 269, 327, 65, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Chk_SRand = GUICtrlCreateCheckbox("Enable Scheme Randomization", 14, 351, 193, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetCursor(-1, 0)
$Group23 = GUICtrlCreateGroup("Screenshots", 397, 31, 81, 108)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$ScrSht_FChk = GUICtrlCreateCheckbox("Fail", 402, 51, 41, 17)
GUICtrlSetCursor(-1, 0)
$ScrSht_SChk = GUICtrlCreateCheckbox("Success", 402, 74, 65, 17)
GUICtrlSetCursor(-1, 0)
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
GUICtrlSetCursor(-1, 0)
$Coord_y = GUICtrlCreateInput("00", 443, 242, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
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
GUICtrlSetCursor(-1, 0)
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
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet2 = GUICtrlCreateTabItem("Stats")
GUICtrlSetState(-1,$GUI_SHOW)
$Group4 = GUICtrlCreateGroup("Errors", 5, 389, 473, 65)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$pauses = GUICtrlCreateLabel("Video Auto Pause", 16, 405, 105, 17)
$VAPE = GUICtrlCreateEdit("", 128, 400, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
$Label2 = GUICtrlCreateLabel("Private Videos", 16, 424, 86, 17)
$ChkZeroErrGUI = GUICtrlCreateEdit("", 278, 422, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
$Label3 = GUICtrlCreateLabel("Restarts", 367, 424, 51, 17)
$Rsrt = GUICtrlCreateEdit("", 430, 422, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
$Label9 = GUICtrlCreateLabel("Check Zero", 199, 424, 70, 17)
$PrivVideoGUI = GUICtrlCreateEdit("", 128, 422, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
$Label10 = GUICtrlCreateLabel("Session Expired", 335, 400, 94, 17)
$Session_Expired_Counter_GUI = GUICtrlCreateEdit("", 430, 400, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
$Label11 = GUICtrlCreateLabel("Video Loading", 527, 380, 85, 17)
$ShrtVideo = GUICtrlCreateEdit("", 278, 400, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
$Label21 = GUICtrlCreateLabel("", 16, 443, 4, 4)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label13 = GUICtrlCreateLabel("Short Videos", 203, 405, 76, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$basicstarts = GUICtrlCreateGroup("Time", 126, 30, 230, 145)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$RunTime = GUICtrlCreateLabel("Runtime", 132, 44, 50, 17)
$Runtimefrm = GUICtrlCreateEdit("", 182, 42, 57, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00:00:00")
GUICtrlSetCursor(-1, 2)
$Group26 = GUICtrlCreateGroup("Cycles", 133, 61, 89, 105)
$lstcycle = GUICtrlCreateEdit("", 137, 79, 81, 81, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_VSCROLL))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group27 = GUICtrlCreateGroup("Avg.", 241, 38, 110, 89)
$Group28 = GUICtrlCreateGroup("Neces", 297, 50, 49, 41)
$Cycle_Nece = GUICtrlCreateEdit("", 305, 67, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0.00")
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group29 = GUICtrlCreateGroup("Curr.", 245, 50, 49, 41)
$Cycle_Avg = GUICtrlCreateEdit("", 249, 67, 41, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00:00")
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label63 = GUICtrlCreateLabel("S. Avg", 250, 104, 42, 17)
$S_Avg = GUICtrlCreateEdit("", 307, 103, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0.00")
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$dwntime = GUICtrlCreateEdit("", 292, 147, 57, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
$internetdwn = GUICtrlCreateLabel("Downtime", 230, 148, 59, 17)
$Label56 = GUICtrlCreateLabel("Uptime", 230, 130, 43, 17)
$UPtime = GUICtrlCreateEdit("", 292, 129, 57, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
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
GUICtrlSetCursor(-1, 2)
$Label5 = GUICtrlCreateLabel("Rate", 364, 57, 31, 17)
$Eco_Rate = GUICtrlCreateEdit("", 409, 57, 38, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
$Label16 = GUICtrlCreateLabel("Rs.", 451, 57, 23, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$Label17 = GUICtrlCreateLabel("Rs.", 451, 86, 23, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$Label54 = GUICtrlCreateLabel("Target", 364, 124, 41, 17)
$Eco_Tar = GUICtrlCreateEdit("", 410, 121, 38, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
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
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group31 = GUICtrlCreateGroup("Done", 19, 201, 49, 41)
$Tar_Hr_Done = GUICtrlCreateEdit("", 31, 219, 25, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group11 = GUICtrlCreateGroup("Today", 130, 188, 110, 57)
$Group32 = GUICtrlCreateGroup("Neces", 186, 200, 49, 41)
$Tar_Today_Nece = GUICtrlCreateEdit("", 198, 218, 25, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group33 = GUICtrlCreateGroup("Done", 134, 200, 49, 41)
$Tar_Today_Done = GUICtrlCreateEdit("", 146, 218, 25, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label1 = GUICtrlCreateLabel("Achieving Possible Today?", 13, 258, 157, 17)
GUICtrlSetFont(-1, 7, 800, 0, "MS Sans Serif")
$Tar_AchPos = GUICtrlCreateEdit("", 190, 254, 41, 17, BitOR($ES_CENTER,$ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "Yes")
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group14 = GUICtrlCreateGroup("Views", 5, 29, 119, 145)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label50 = GUICtrlCreateLabel("Successful", 10, 45, 66, 17)
$Label51 = GUICtrlCreateLabel("Attempted", 10, 67, 61, 17)
$S_View = GUICtrlCreateEdit("", 85, 44, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor(-1, 2)
$A_View = GUICtrlCreateEdit("", 85, 61, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor(-1, 2)
$Group12 = GUICtrlCreateGroup("S. Rate", 43, 116, 57, 49)
$S_Rate = GUICtrlCreateEdit("", 48, 137, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
$Label15 = GUICtrlCreateLabel("%", 85, 137, 13, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label7 = GUICtrlCreateLabel("Hustled", 10, 85, 47, 17)
$Edit12 = GUICtrlCreateEdit("", 85, 84, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "00")
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group35 = GUICtrlCreateGroup("Randomization", 5, 278, 145, 112)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label26 = GUICtrlCreateLabel("Target", 11, 296, 41, 17)
$Rand_Tar = GUICtrlCreateInput("000", 111, 293, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$ES_READONLY,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label52 = GUICtrlCreateLabel("Hustle", 11, 329, 40, 17)
GUICtrlSetFont(-1, 2, 800, 0, "MS Sans Serif")
$Rand_Hus = GUICtrlCreateInput("000", 111, 324, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$ES_READONLY,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
$Label53 = GUICtrlCreateLabel("Setting Scheme", 11, 361, 93, 17)
$Rand_Setting = GUICtrlCreateInput("000", 112, 355, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE,$ES_READONLY,$WS_BORDER))
GUICtrlSetFont(-1, 5, 800, 0, "MS Sans Serif")
GUICtrlSetCursor(-1, 0)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group40 = GUICtrlCreateGroup("Expiry", 249, 221, 229, 57)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label58 = GUICtrlCreateLabel("Days left for License to Expire", 259, 244, 175, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
$Expirydate_gui = GUICtrlCreateEdit("", 439, 244, 25, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group34 = GUICtrlCreateGroup("Expiry", 249, 175, 229, 47)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
$Label12 = GUICtrlCreateLabel("PushBullet Alerts Sent", 267, 198, 130, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
$Psh_Sent = GUICtrlCreateEdit("", 431, 196, 33, 17, BitOR($ES_READONLY,$ES_WANTRETURN))
GUICtrlSetData(-1, "0")
GUICtrlSetCursor(-1, 2)
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
GUICtrlSetCursor(-1, 0)
$Start = GUICtrlCreateButton("Start ", 0, 560, 97, 25, $BS_PUSHLIKE)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xC0C0C0)
GUICtrlSetCursor(-1, 0)
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
FirstLoad()
Func FirstLoad()
GUICtrlSetData($hProgressSplash, "Finishing...")
GUIDelete($hSplash)
Calc_Runtime(0)
GUI_VarAll()
SetGUIValues()
Load_All()
GUI_VarAll()
Config_ActSettings()
Get_Earnings(0)
Get_TargetEarnings()
CurrentProgress(75)
Push_AllInfo($GPsh_AftCyc,$GPsh_Tk1,$GPsh_Tk2,$GPsh_Tk3,$GPsh_Tk4,"Initialised @ "&@HOUR&":"& @MIN&":"&@SEC,"VVA Initialised on PC:"&@ComputerName&" using ID:"&String($GLoginID))
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
Func GUI_VarAll()
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
If _IsChecked($autostartcheck) Then
Global $Gautostartcheck=1
Else
Global $Gautostartcheck=0
EndIf
Global $GCIAP=GUICtrlRead($CIAP)
Global $GNickName_Edit=GUICtrlRead($NickName_Edit)
Global $GZ_Lim=GUICtrlRead($Z_Lim)
Global $GL_Lim=GUICtrlRead($L_Lim)
Global $GLoginID=GUICtrlRead($LoginID)
Global $GPassword=GUICtrlRead($Password)
If _IsChecked($ScrSht_FChk) Then
Global $GScrSht_FChk=1
Else
Global $GScrSht_FChk=0
EndIf
Global $GG_Ping=GUICtrlRead($G_Ping)
If _IsChecked($ScrSht_SChk) Then
Global $GScrSht_SChk=1
Else
Global $GScrSht_SChk=0
EndIf
Global $GCoord_x=GUICtrlRead($Coord_x)
Global $GCoord_y=GUICtrlRead($Coord_y)
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
Func Load_All()
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
CheckIfTrue($autostartcheck,$Gautostartcheck)
$GChk_Shtdwn=Dir_Load(0,"Shutdown", "GChk_Shtdwn", $GChk_Shtdwn)
CheckIfTrue($Chk_Shtdwn,$GChk_Shtdwn)
CheckIfTrue($S1_TarChk,$GS1_TarChk)
CheckIfTrue($S1_HusChk,$GS1_HusChk)
CheckIfTrue($S1_RandChk,$GS1_RandChk)
CheckIfTrue($S1_Chk,$GS1_Chk)
CurrentProgress(60)
CheckIfTrue($S2_TarChk,$GS2_TarChk)
CheckIfTrue($S2_HusChk,$GS2_HusChk)
CheckIfTrue($S2_RandChk,$GS2_RandChk)
CheckIfTrue($S2_Chk,$GS2_Chk)
CurrentProgress(70)
CheckIfTrue($S3_TarChk,$GS3_TarChk)
CheckIfTrue($S3_HusChk,$GS3_HusChk)
CheckIfTrue($S3_RandChk,$GS3_RandChk)
CheckIfTrue($S3_Chk,$GS3_Chk)
CheckIfTrue($Psh_Chk,$GPsh_Chk)
CheckIfTrue($ScrSht_FChk,$GScrSht_FChk)
CheckIfTrue($ScrSht_SChk,$GScrSht_SChk)
CheckIfTrue($Chk_SRand,$GChk_SRand)
ToolTip2("Previously Saved Data Loaded!")
EndFunc
Func Dir_Load($iChoice,$cS_Group,$cS_Name,$cVData,$sSavedPath="Configurations\Default\")
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
Func CheckIfTrue($ChckBoxVar,$ChckBoxData)
$ChckBoxData=String($ChckBoxData)
If $ChckBoxData=0 Or $ChckBoxData="0" Then
GUICtrlSetState($ChckBoxVar, $GUI_UNCHECKED)
ToolTip2($ChckBoxVar&" is UnChecked.")
Else
GUICtrlSetState($ChckBoxVar, $GUI_CHECKED)
ToolTip2($ChckBoxVar&" is Checked.")
EndIf
EndFunc
Func Save_All()
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
Func Dir_Save($cS_Group,$cS_Name,$cData,$sSavedPath="Configurations\Default\")
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
CurrentProgress(20)
Runtime_Cycle_Avg()
UpdateViewsToday()
Global $RTime_Secs=Calc_Runtime(0)
Global $Hours_Els=TimeElap_Hour($RTime_Secs)
Global $iV_Hour=ViewsThisHr("return")
Global $iTarHour=GUICtrlRead($Tar_Hr_Nece)
GUICtrlSetData($Tar_Today_Done,$SuccessfulViews)
ToolTip2("Setting $ViewsThisHr as: "&$iV_Hour)
GUICtrlSetData($Tar_Hr_Done,$iV_Hour)
$iTime_ElspHr_Mins=Calc_Runtime(0)
$iTime_ElspHr_Mins=$iTime_ElspHr_Mins/60
CurrentProgress(50)
GUICtrlSetData($S_View,$SuccessfulViews)
GUICtrlSetData($A_View,$AttemptedViews)
GUICtrlSetData($S_Rate,$SuccessfulViews/$AttemptedViews*100)
Global $sTime = _TimeSystemRestart(2)
GUICtrlSetData($UPtime,$sTime)
EndFunc
Func TimeElap_Hour($SlpMng_TElp)
ToolTip2("Time Elapsed Hour called")
If($SlpMng_TElp>$1Hour) Then
ToolTip2("While Looping to find the number of Hours Elapsed...")
While($SlpMng_TElp>$1Hour)
$SlpMng_TElp=$SlpMng_TElp-$1Hour
$Hours_Els=$Hours_Els+1
WEnd
ToolTip2("Hours Elapsed : "&$Hours_Els)
Return $Hours_Els
Else
Return $Hours_Els
EndIf
EndFunc
Func ViewsThisHr($iChoice)
Switch $iChoice
Case "add"
If $Hours_Els = $iHours_LastC Then
ToolTip2("Hour same as last hour. Incrementing Views")
$iViews_ThisHour=$iViews_ThisHour+1
ToolTip2("Views this Hour: "&$iViews_ThisHour)
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
Func TogglePause()
ToolTip2("Script Paused!")
$Paused = NOT $Paused
While $Paused
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
ToolTip2("Exiting Chrome...")
ProcessClose("Chrome.exe")
ToolTip2("Chrome Killed!")
EndFunc
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
ToolTip2(" Successful Views / Attempted Views = "&$SuccessfulViews&" / "&$AttemptedViews)
SetGUIValues()
MoveWindow()
CheckSuccess()
$Brn_Ctr=$Brn_Ctr+1
Local $Brn_Ctr_alt = Mod($Brn_Ctr, 5 )
If $Brn_Ctr_alt=0 Then
Check_TargetAchieved()
EndIf
Runtime_Display()
ResetCounters()
WEnd
EndFunc
Func NavigateToWebsite()
ToolTip2("Closing Previous Instances of Chrome...")
WinActivate("Google Chrome")
Send("{CTRLDOWN}")
Send("{SHIFTDOWN}")
Send("q")
Send("{CTRLUP}")
Send("{SHIFTUP}")
ToolTip2("Quiting Chrome as Recommended")
ToolTip2("Forcefully Closing Chrome")
ProcessClose("Chrome.exe")
ToolTip2("Forcefully Closing Chrome #2")
ProcessClose("Chrome.exe")
ToolTip2("Initialising Chrome...")
ShellExecute("Chrome.exe","--incognito http://videoz.bposervice.co.in/Default.aspx")
WinWait("Google")
ToolTip2("Resizing and Moving Chrome")
WinMove("Google","",0,0,944, 680)
MouseMove(0,0,0)
Sleep(3000)
WinWait("videoz","",30)
CheckSiteLoad_videoz()
EndFunc
Func CheckDowntime()
EndFunc
Func Login()
ToolTip2("Initialising Logging In Sequence..")
CheckDowntime()
ControlClick2("videoz","","","left",2,$LoginTextField[0],$LoginTextField[1])
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
ToolTip2("Login Successful!")
Else
WinActivate("videoz.bposervice.co.in/session.aspx")
If WinActivate("videoz.bposervice.co.in/session.aspx")=True Then
ToolTip2("Multiple Logins Detected!")
CheckClearLogin()
Else
CheckDowntime()
Restart("Error while Logging in.")
EndIf
EndIf
EndFunc
Func CheckClearLogin()
CheckDowntime()
ToolTip2("'Warning' text Detected! Clicking Clear Logins and Retrying...")
ControlClick2("videoz","","","left",1,$ClearLoginBtn[0],$ClearLoginBtn[1])
ToolTip2("Retrying Please Wait...")
CheckDowntime()
WinWait("videoz","",20)
WinActivate("videoz")
If WinActivate("videoz")=False Then
Restart("Error while Logging in.")
EndIf
Sleep(4000)
CheckSiteLoad_videoz()
Login()
EndFunc
Func MoveWindow()
CheckDowntime()
WinActivate("Click")
If WinActivate("Click")=False Then
CloseAllOtherTabs("Home",1)
ToolTip2("Clicking Open Workspace...")
CheckDowntime()
Sleep(750)
ControlClick2("Home","","","left",1,$OpenWorkspaceBtn[0],$OpenWorkspaceBtn[1])
Sleep(500)
CheckSiteLoad_Click()
EndIf
Switch $iLoadOther
Case 1
ToolTip2("$iLoadOther=0, Loading Other Videos.")
Send("{TAB 2}")
Send("{ENTER}")
$iLoadOther=0
EndSwitch
ClickView()
EndFunc
Func MoveWindow_LoadOther()
CheckDowntime()
CloseAllOtherTabs("Home",1)
CheckDowntime()
ToolTip2("Clicking Open Workspace...")
ControlClick2("Home","","","left",1,331, 338)
Sleep(500)
CheckSiteLoad_Click()
WinMove("Click ","",0, 0,944, 680)
WinActivate("Click ")
Sleep(500)
ToolTip2("Clicking Load Other Videos")
Send("{TAB 2}")
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
Else
ToolTip2("Site Not Loaded!")
$SiteLoad_Counter=$SiteLoad_Counter+1
If $SiteLoad_Counter=25 Then
$SiteLoad_Counter=1
Restart("videoz.bposervice.co.in - Failed to Load Counter (25) Reached.")
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
EndIf
WEnd
Switch $iChoice
Case 0
ToolTip2("Closing all the tabs to the right.")
Send("{ALTdown}")
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
ToolTip2("Clicking View...")
Sleep(250)
Send("{TAB 3}")
Send("{ENTER}")
CheckVideoViewerLoaded()
EndFunc
Func CheckVideoViewerLoaded($iChoice=0)
$CVVL_Ctr=0
If $CVVL_Ctr=0 Then
CheckDowntime()
Local $hP_ColorReq=0xD6C900
Local $hP_ColorTest = PixelGetColor(246, 122)
If $hP_ColorTest = $hP_ColorReq Then
$CVVL_Ctr=1
$CheckViewer_Counter=0
ToolTip2("VideoViewer Loaded!")
Switch $iChoice
Case 0
CheckYouTubeLoaded()
Case 1
ToolTip2("VideoViewer WP is On...")
EndSwitch
Else
$CVVL_Ctr=0
ToolTip2("VideoViewer Not Loaded! Retrying in 3 seconds")
$VideoViewer_LoadErr=$VideoViewer_LoadErr=1
$CheckViewer_Counter=$CheckViewer_Counter+1
Sleep(1000)
If $CheckViewer_Counter=3 Then
ControlClick2("Click","","","left",1,472, 470)
Sleep(2000)
CheckSiteLoad_Click()
WinWait("Click ","",15)
ToolTip2("Clicking View...")
Sleep(250)
Send("{TAB 3}")
Send("{ENTER}")
Sleep(500)
EndIf
If $CheckViewer_Counter=5 Then
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
CheckDowntime()
WinActivate("Click ")
Opt("PixelCoordMode", 0)
$var2 = PixelGetColor(484, 546)
$var2_2 = PixelGetColor(488, 147)
$var2_3 = PixelGetColor(482, 346)
ToolTip2("Color of $var2_3:"&$var2_3&" "&$check_var)
$var2_4 = PixelGetColor(377, 271)
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
ToolTip2("Checking Video Load Counter - "&$CheckYouTubeLoaded_Counter)
$CheckYouTubeLoaded_Counter=$CheckYouTubeLoaded_Counter+1
Local $cCounter_alt1 = Mod($CheckYouTubeLoaded_Counter, 3 )
If $cCounter_alt1 = 0 Then
CheckDowntime()
EndIf
If $CheckYouTubeLoaded_Counter>=$GL_Lim Then
$VideoLoading_Errors=$VideoLoading_Errors+1
$CheckYouTubeLoaded_Counter=0
ClosePopUp()
Return
EndIf
EndFunc
Func ClosePopUp()
ToolTip2("Closing PopUp!")
WinActivate("Google")
ControlClick2("Click ","","","left",1,888, 66)
CheckDowntime()
MoveWindow_LoadOther()
Return
EndFunc
Func CheckDeletedVideo($iChoice=0)
WinActivate("Click ")
$CheckYouTubeLoaded_Counter=0
Local $hP_ColorReq=0xCBCBCB, $hP_ColorTest = PixelGetColor(697, 392)
Local $hP_ColorReq_2=0xDADADA, $hP_ColorTest_2 = PixelGetColor(448, 202)
If( $hP_ColorTest = $hP_ColorReq Or $hP_ColorTest_2 = $hP_ColorReq_2 ) Then
ToolTip2("Deleted / Private Video Detected!")
$Private_V_Ctr=$Private_V_Ctr+1
GUICtrlSetData($PrivVideoGUI,$Private_V_Ctr)
ClosePopUp()
Return
Else
WinActivate("Click")
MouseClick("left",458,317,1,0)
MouseMove(0,0,0)
Switch $iWatchRedirect
Case 0
ToolTip2("$iWatchRedirect=0, Calling WatchFor30Seconds...")
WatchFor30Seconds("CheckDeletedVideo")
EndSwitch
EndIf
EndFunc
Func WatchFor30Seconds($sCalledFrom="Default")
MouseMove(1,1,1)
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
If WinActivate("Click ")=True Then
_ScreenCapture_Capture("image.bmp", $DisplayTimeUpperLeft[0],$DisplayTimeUpperLeft[1], $DisplayTimeLowerRight[0],$DisplayTimeLowerRight[1])
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
$cCounter_alt = Mod($cCounter, 3 )
If $OutPutPath="56|" Or $OutPutPath="56|" Or $OutPutPath="57|" Or $OutPutPath="58|" Or $OutPutPath="59|" Or $OutPutPath="60|" Or $OutPutPath="61|" Or $OutPutPath="62|" Or $OutPutPath="63|" Or $OutPutPath="64|" Or $OutPutPath="65|" Or $OutPutPath="67|" Or $OutPutPath="68|" Or $OutPutPath="69|" Or $OutPutPath=";55|" Or $OutPutPath=";56|" Or $OutPutPath=";57|" Or $OutPutPath=";58|" Or $OutPutPath=";59|" Or $OutPutPath=";60|" Or $OutPutPath=";61|" Or $OutPutPath=";62|" Or $OutPutPath=";63|" Or $OutPutPath=";64|" Or $OutPutPath=";65|" Or $OutPutPath=";67|" Or $OutPutPath=";68|" Or $OutPutPath=";69|" Or $OutPutPath=";70|" Or $OutPutPath=";71|" Or $OutPutPath=";72|" Or $OutPutPath=";73|" Or $OutPutPath=";74|" Or $OutPutPath=";75|" Or $OutPutPath=";76|" Or $OutPutPath="71|" Or $OutPutPath="72|" Or $OutPutPath="73|" Or $OutPutPath="74|" Or $OutPutPath="75|" Or $OutPutPath="77|" Or $OutPutPath="78|" Or $OutPutPath="79|" Or $OutPutPath="76|" Or $OutPutPath="81|" Or $OutPutPath="82|" Or $OutPutPath="83|" Or $OutPutPath="84|" Or $OutPutPath="85|" Or $OutPutPath="87|" Or $OutPutPath="88|" Or $OutPutPath="89|" Or $OutPutPath="86|" Or $OutPutPath="70|" Or $OutPutPath="80|" Or $OutPutPath="90|" Or $OutPutPath="90|" Or $OutPutPath="91|" Or $OutPutPath="92|" Or $OutPutPath="93|" Or $OutPutPath="94|" Or $OutPutPath="95|" Or $OutPutPath="96|" Or $OutPutPath="97|" Or $OutPutPath="98|" Or $OutPutPath="99|" Then
$iStillWatch=1
EndIf
If $cCounter=$GWatchCounterLim Then
$iStillWatch=1
$iLoadOther=1
Return
EndIf
$cCounter=$cCounter+1
If $cCounter_alt = 0 And $iStillWatch=0 Then
CheckVideoViewerLoaded(1)
CheckIfShortVideo()
CheckIfAccidentlyPaused()
CheckDowntime()
EndIf
WEnd
ToolTip2("Watch Completed!")
$iWatchRedirect=0
ToolTip2("Clicking Close Video Viewer.")
ControlClick2("Click ","","","left",1,470, 662)
EndFunc
Func CheckIfZero()
If $OutPutPath="0|" Or $OutPutPath=";0|" Or $OutPutPath=" 0 " Or $OutPutPath="0|" Or $OutPutPath=";0" Or $OutPutPath=" " Or $OutPutPath="0 " Or $OutPutPath=" 0" Or $OutPutPath= ";0" Or $OutPutPath="O|" Or $OutPutPath="o|" Then
ToolTip2("Zero Detected! Counter- "&$CheckIfZero_Counter)
$CheckIfZero_Counter=$CheckIfZero_Counter+1
Sleep(750)
Else
$CheckIfZero_Counter=0
EndIf
If $CheckIfZero_Counter=5 Then
ToolTip2("CheckIfZero() Reached 5, Clicking Play.")
MouseClick("left",333, 216,1,0)
MouseMove(0,0,0)
Return
EndIf
If $CheckIfZero_Counter>=$GZ_Lim Then
$ChkZeroCtr=$ChkZeroCtr+1
GUICtrlSetData($ChkZeroErrGUI,$ChkZeroCtr)
$CheckIfZero_Counter=0
$iLoadOther=1
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
ToolTip2("C-I-A-P Variables Initialised	: "&$CIAP_Var3)
EndIf
$CIAP_Var2_Counter=$CIAP_Var2_Counter+1
If $CIAP_Var2_Counter=$GCIAP Then
$CIAP_Var2_Counter=0
$CIAP_Var1=$OutPutPath
ToolTip2("C-I-A-P Limit Reached Checking for Pauses")
If $CIAP_Var1=$CIAP_Var3 Then
$CIAP_FuncCounter=$CIAP_FuncCounter+1
$CIAP_Error=$CIAP_Error+1
GUICtrlSetData($VAPE,$CIAP_Error)
WinActivate("Click ")
ToolTip2("Video Paused! Clicking Play : "&$CIAP_Var1&"="&$CIAP_Var3)
Send("{SPACE}")
MouseMove(0,0,0)
$CIAP_Var2_Counter=0
Else
$CIAP_FuncCounter=0
$CIAP_Var3=""
$CIAP_Var1=""
EndIf
EndIf
EndFunc
Func CheckIfShortVideo()
Local $CSC_V1 = PixelGetColor(784, 142)
Local $CSC_C1 = 0xCBCBCB
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
ToolTIp2("$iWatchRedirect=1 & $cCounter=0")
ClosePopUp()
Else
EndIf
EndFunc
Func CheckSuccess()
CheckDowntime()
ToolTip2("Checking for Successful Watch!")
WinActivate("Click ")
Sleep(2000)
Local $msg = PixelSearch(13, 146,74, 172, 0x008000,25)
If Not @error Then
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
If WinActivate("Session") Then
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
Global $RunTime_Var = TimerInit()
$RunTime_Counter=$RunTime_Counter+1
EndFunc
Func Runtime_Display()
Global $Runtime_Var2 = TimerDiff($Runtime_Var)
$RunTime_Var3=$Runtime_Var2
If $RunTime_Counter=1 Then
$Runtime=Sec2Time($Runtime_Var3/1000)
_GUICtrlEdit_AppendText($lstcycle,$Runtime&@CRLF)
Else
Runtime_Cycle()
$Runtime_Raw=$Runtime_Raw+$Runtime_Var3
$Runtime=Sec2Time($Runtime_Raw/1000)
EndIf
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
EndFunc
Func Update_Runtime()
GUICtrlSetData($Runtimefrm,Calc_Runtime(1))
EndFunc
Func _TimeSystemRestart($iFlag = 0)
Local $iSubTotal = DllCall('kernel32.dll', 'int', 'GetTickCount')
If Not IsArray($iSubTotal) Then Return SetError(1, 0, 0)
If $iFlag = 1 Then Return $iSubTotal[0]
$iSubTotal = $iSubTotal[0] / 1000
Local $iWeek = Int(($iSubTotal / 604800))
If $iWeek > 0 Then $iSubTotal -= $iWeek * 604800
Local $iDay = Int(($iSubTotal / 86400))
If $iDay > 0 Then $iSubTotal -= $iDay * 86400
Local $iHour = Int(($iSubTotal / 3600))
Local $iMin = Int(($iSubTotal -($iHour * 3600)) / 60)
Local $iSec = Int(($iSubTotal - $iHour * 3600) -($iMin * 60))
Local $sRET = StringFormat('%02d', $iWeek) & ':' & $iDay & ':' & StringFormat('%02d', $iHour) & ':' & StringFormat('%02d', $iMin) & ':' & StringFormat('%02d', $iSec)
If $iFlag = 2 Then Return $sRET
Return StringSplit($sRET, ':')
EndFunc
Func _ErrFunc($oError)
ToolTip2("Internet Down! Failed to use HTTPRequests! Moving on...")
EndFunc
Func UpdateViewsToday()
ToolTip2("Starting to Write in TodaysFile")
WriteViewsTodayFileName()
ReadViews()
WriteViews()
ReadViews()
EndFunc
Func WriteViewsTodayFileName()
Global $SavedDate_Config
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
EndFunc
Func ReadViews()
If Not _FileReadToArray("Views\"&$FileName, $StoredViews, 0) Then
GUICtrlSetData($TotalViews,00)
EndIf
ToolTip2("Reading from File "&$FileName)
Local $StoredViews_1 = _ArrayToString($StoredViews)
$StoredViews=$StoredViews_1
ToolTip2("Views  :"& $StoredViews)
GUICtrlSetData($TotalViews,$StoredViews)
EndFunc
Func Push_AllInfo($iPushafter,$GFPsh_Tk1,$GFPsh_Tk2,$GFPsh_Tk3,$GFPsh_Tk4,$cMsg_T="",$cMsg_B="",$iForce=0)
If $GPsh_Chk=1 Then
If $cMsg_T="" And $cMsg_B="" Then
$cCounter_push=$cCounter_push+1
Local $cCounter_push1 = Mod($cCounter_push, $iPushafter )
ToolTip2("Pushbullet Aft. Cyc :" &$iPushafter)
ToolTip2("Pushbullet Ctr. Cyc :" &$cCounter_push)
If $cCounter_push1 = 0 Or $iForce=1 Then
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
Local $sPD = '{"type": "note", "title": "'&$spTitle&'","body": "'&$sBody&'"}'
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
$oHTTP.Open("POST", "https://api.pushbullet.com/v2/pushes", False)
$oHTTP.setRequestHeader("Authorization", "Bearer " & $GFPsh_Tk)
$oHTTP.SetRequestHeader("Content-Type", "application/json")
$oHTTP.Send($sPD)
$Result = $oHTTP.ResponseText
ToolTip2("PushBullet :"&$Result)
ToolTip2("PushBullet Sent - "&$spTitle&" : "&$sBody&" "&$GFPsh_Tk)
EndFunc
Func Get_Earnings($iViews)
Local $iSlab_1=1201
Local $iSlab_2=801
Local $iSlab_3=401
Local $iSlab_4=101
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
Local $iSlab_1=1201
Local $iSlab_2=801
Local $iSlab_3=401
Local $iSlab_4=101
Local $ieSlab_1=0.75
Local $ieSlab_2=0.55
Local $ieSlab_3=0.35
Local $ieSlab_4=0.20
Local $ieSlab_min=0.10
If $iViews2 >= $iSlab_1 Then
$fIncome2=$iViews2*$ieSlab_1
Else
If $iViews2 >= $iSlab_2 Then
$fIncome2=$iViews2*$ieSlab_2
Else
If $iViews2 >= $iSlab_3 Then
$fIncome2=$iViews2*$ieSlab_3
Else
If $iViews2 >= $iSlab_4 Then
$fIncome2=$iViews2*$ieSlab_4
Else
If $iViews2 < $iSlab_4 Then
$fIncome2=$iViews2*$ieSlab_min
EndIf
EndIf
EndIf
EndIf
EndIf
ToolTip2("Income : "&$fIncome2)
GUICtrlSetData($Eco_Tar,$fIncome2)
EndFunc
Func ControlClick2($scTitle,$scText,$scControlId,$scButton,$icClicks,$icX,$icY)
Local $OffSetX=0
Local $OffSetY=0
ControlClick($scTitle,$scText,$scControlId,$scButton,$icClicks,$icX+$OffSetX,$icY+$OffSetY)
EndFunc
Func Calibrate_Main()
ToolTip2("Starting Calibration")
MsgBox("",$g_sAppFullTitle, "First Open Chrome, LogIn to the website and then close the Window. Don't log out as we need to see the Clear Login Button!")
WriteCoords("LoginTextField",1)
WriteCoords("ClearLoginBtn",1)
WriteCoords("OpenWorkspaceBtn",1)
MsgBox("",$g_sAppFullTitle, "Wait till the video has played upto 50 seconds then Pause the video, click OK ")
Local $iSatisfied=0
While $iSatisfied=0
WriteCoords("DisplayTimeUpperLeft",1)
WriteCoords("DisplayTimeLowerRight",1)
Global $DisplayTimeUpperLeft = LocationRead("DisplayTimeUpperLeft",1)
Global $DisplayTimeLowerRight = LocationRead("DisplayTimeLowerRight",1)
WinActivate("Click ")
FileDelete("image.bmp")
_ScreenCapture_Capture("image.bmp", $DisplayTimeUpperLeft[0],$DisplayTimeUpperLeft[1], $DisplayTimeLowerRight[0],$DisplayTimeLowerRight[1])
ShellExecuteWait("image.bmp")
$ans = MsgBox(3,$g_sAppFullTitle,"Is this Screenshot OK?")
Select
Case $ans = 6
$iSatisfied=1
Case $ans = 7
$iSatisfied=0
EndSelect
Wend
WriteCoords("VideoViewerCloseBtn",1)
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
Sleep(25)
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
$LocV1 = StringTrimLeft($LocV,2)
$LocV1=StringSplit($LocV1,",")
$iCoords[0]=Int($LocV1[1])
$iCoords[1]=Int($LocV1[2])
ToolTip2("Location of "& $j_Place&$j_Counter& "is "& $iCoords[0]&$iCoords[1])
Return($iCoords)
EndFunc
