CreateImageList()
Width:=85,XPos:=115,WinHeight:=220
;~ Gui,New,LabelSpy hWndhSpyWnd
Gui,+HWNDMainWindow +AlwaysOnTop
hSpyWnd:=MainWindow
Gui,Font,s9,Segoe UI
Gui,Add,Picture,hWndhFindTool gFindToolHandler x10 y12 w31 h28,%Bitmap1%
Gui,Add,Text,x48 y10 w198,Drag the Finder Tool over a window`nto select it,then release the mouse
Gui,Add,Text,x28 w%Width% h23 +0x202,Handle:
Gui,Add,Edit,vEdtHandle HWNDHWNDHWND ReadOnly x%XPos% yp w356 h21
Gui,Add,Text,vTxtText x28 w%Width% h21 +0x202,Text:
Gui,Add,Edit,vEdtText HWNDTextHWND x%XPos% yp w290 h21
Gui,Add,Button,vBtnSetText gSetText x412 yp-1 w60 h23,&Set Text
Gui,Add,Text,x28 w%Width% +0x202,Parent Window:
Gui,Add,Edit,vEdtClass x%XPos% HWNDParentHWND y150 w356 r3 ReadOnly yp -Wrap ; -E0x200 ReadOnly ;This should show parent window
;~ Gui,Add,Edit,vEdtClass x%XPos% Top_Class y150 w356 r3 ReadOnly yp -Wrap ; -E0x200 ReadOnly ;This should show parent window
Gui,Add,Text,x28 w%Width% h21 +0x202,Control: ;
Gui,Add,Edit,vEdtClassNN HWNDClassNNHWND x%XPos% yp w356 h21 ReadOnly ; -E0x200 ReadOnly ;
Gui,Add,Button,gShowFindDlg x%XPos% y190 w84 h24,&Find...
Gui,Add,Button,% "gTreeVis x" XPos+90 " y190 w84 h24",&Tree...
Gui,Add,TreeView,xm w460 h300 gShowItem ImageList%ImageList% AltSubmit
Gui,Add,Button,gShowTree,&Refresh All
IniRead,px,%IniFile%,Settings,x,Center
IniRead,py,%IniFile%,Settings,y,Center
Gui,Show,h%WinHeight%,%AppName% ; Show main window  Settings for main height of GUI
if(g_Minimize){
	WinMove ahk_id %hSpyWnd%,,,,,78
	g_Minimized := True
}
Gui,Show