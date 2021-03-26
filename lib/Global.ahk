Global AppName := "Simple Spy"
, Version := "1.0.1"
, IniFile := AppName . ".ini"
, ResDir := A_ScriptDir . "\Resources"
,Moving
, hFindTool
, Bitmap1 := ResDir . "\FindTool1.bmp"
, Bitmap2 := ResDir . "\FindTool2.bmp"
, hCrossHair := DllCall("LoadImage", "Int", 0
    , "Str", ResDir . "\CrossHair.cur"
    , "Int", 2 ; IMAGE_CURSOR
    , "Int", 32, "Int", 32
    , "UInt", 0x10, "Ptr") ; LR_LOADFROMFILE
, hOldCursor
, Dragging := False

, g_Borders := []
, g_hWnd
, hSpyWnd
, hTab
, hStylesTab
, hWindowsTab
, g_Style
, g_ExStyle
, g_ExtraStyle
, g_WinMsgs := ""
, hCbxMsg
, Cursors := {}
, oStyles := {}
, Workaround := True
, FindDlgExist := False
, MenuViewerExist := False
, hTreeWnd := 0
, TreeIcons := ResDir . "\TreeIcons.icl"
, ImageList
, g_TreeShowAll := False
, g_Minimized
, g_MouseCoordMode := "Screen"
,ID
, g_DetectHidden
, g_Minimize
, g_AlwaysOnTop
,MainWindow
,ClassNNHWND
,TextHWND,HWNDHWND,ParentHWND,TreeIDs:=[],ShowTreeHWND,WinHeight