ShowTree(){
	TV_Delete()
	RootID:=TV_Add("Desktop",0,"Icon2")
	TreeIDs[RootID]:=DllCall("GetDesktopWindow","Ptr")
	SplashTextOn,200,100,Getting Windows,Please Wait...
	WinGet WinList, List
	Loop %WinList% {
		hWnd:=WinList%A_Index%
		WinGetClass,Class,ahk_id %hWnd%
		WinGetTitle,Title,ahk_id %hWnd%
		if(Title != ""){
			Title := " - " . Title
		}
		Invisible := !IsWindowVisible(hWnd)
		if(!g_TreeShowAll && Invisible) {
			Continue
		}
		if(Invisible) {
			Title.=" (hidden)"
		}
		Icon:=GetWindowIcon(hWnd,Class,True)
		Text:=Class Title,Text:=StrLen(Text)>40?SubStr(Text,1,40) "...":Text
		TreeIDs[(TV:=TV_Add(Text,RootID,"Icon" Icon))]:=hWnd
		Tree(hWnd,TV)
	}
	GuiControl,+Redraw,SysTreeView321
	ControlFocus,SysTreeView321,%ID%
	TV_Modify(TV_GetChild(0),"Select Vis Focus")
	SplashTextOff
}