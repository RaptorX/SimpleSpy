;~ Simple_Spy.ahk   by Maestrith and Joe Glines
;~ Inspired & borrowed from:  https://www.autohotkey.com/boards/viewtopic.php?f=6&t=28220  by Alguimist
#SingleInstance,Force
#NoEnv
#MaxMem 640
#KeyHistory 0
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows On
CoordMode Mouse, Screen
SetControlDelay -1
SetWinDelay -1
SetBatchLines -1
ListLines Off

#include lib\ScriptObj\scriptobj.ahk

global script := {base			: script
				 ,name			: regexreplace(A_ScriptName, "\.\w+")
				 ,version		: "1.2.2"
				 ,author		: "Maestrith and Joe Glines"
				 ,email			: "joe@the-automator.com"
				 ,homepagetext	: "www.the-automator.com/simplespy"
				 ,homepagelink	: "www.the-automator.com/simplespy?src=app"
				 ,resfolder		: A_ScriptDir "\res"
				 ,iconfile		: A_ScriptDir "\res\WinSpy.ico"
				 ,config 		: A_ScriptDir "\settings.ini"}

Global AppName := script.name " - the-Automator.com"
, IniFile := AppName . ".ini"
, Moving
, hFindTool
, Bitmap1 := script.resfolder . "\FindTool1.bmp"
, Bitmap2 := script.resfolder . "\FindTool2.bmp"
, hCrossHair := DllCall("LoadImage", "Int", 0
					   , "Str", script.resfolder . "\CrossHair.cur"
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
, TreeIcons := script.resfolder . "\TreeIcons.icl"
, ImageList
, g_TreeShowAll := False
, g_Minimized
, g_MouseCoordMode := "Screen"
, ID
, g_DetectHidden
, g_Minimize
, g_AlwaysOnTop
, MainWindow
, ClassNNHWND
, TextHWND,HWNDHWND,ParentHWND,TreeIDs:=[],ShowTreeHWND,WinHeight

;@Ahk2Exe-SetMainIcon res\WinSpy.ico
Menu, Tray, NoStandard
Menu, Tray, Icon, % script.iconfile
Menu, Tray, Add, % "Check for Updates", % "Update"
Menu, Tray, Add, % "About"
Menu, Tray, Add
Menu, Tray, Add, % "Reload"
Menu, Tray, Add, % "Exit"

#Include lib\Gui.ahk

ID:="ahk_id" MainWindow
Global hCommandsMenu:=MenuGetHandle("CommandsMenu")
OnMessage(0x200,"MouseMove"),OnMessage(0x202,"LButtonUp")
return ; End of the auto-execute section
+Escape:: ;Exit
GuiClose:
ExitApp
return

#Include lib\ShowBorder.ahk
#Include lib\FindToolHandler.ahk
#Include lib\MouseMove.ahk
#Include lib\SetHandle.ahk
#Include lib\SetText.ahk
#Include lib\ShowTree.ahk
#Include lib\CreateImageList.ahk
#Include lib\Tree.ahk
#Include lib\IsChild.ahk
#Include lib\ShowFindDlg.ahk
#Include lib\TreeVis.ahk
#Include lib\ShowItem.ahk
#Include lib\GetFileIcon.ahk
#Include lib\GetWindowIcon.ahk
#Include lib\IsWindowVisible.ahk
#Include lib\GetParent.ahk
#Include lib\LButtonUp.ahk
#Include lib\GetAncestor.ahk
#Include lib\Control GetClassNN.ahk
#Include lib\MenuFunctions.ahk