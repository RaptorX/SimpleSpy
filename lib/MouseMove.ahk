MouseMove(a,b,c,Win){
	static LastControl,LastAncestor
	if(a="Control")
		return LastControl
	MouseGetPos,,,Window
	if(Window=MainWindow)
		return
	if(Moving){
		DllCall("SetCursor","Ptr",hCrossHair,"Ptr")
		MouseGetPos,,,Win,Control,2
		Ancestor:=GetAncestor(Control)
		if(Ancestor!=LastAncestor&&Ancestor){
			GuiControl,-Redraw,SysTreeView321
			WinGetTitle,Title,ahk_id%Win%
			TV_Delete(),TreeIDs:=[]
			WinGetClass,Class,ahk_id%Win%
			Tree(Win,TV_Add(Title,,"Icon" GetWindowIcon(Ancestor,Class)))
			DllCall("SetCapture","Ptr",hSpyWnd)
			GuiControl,+Redraw,SysTreeView321
		}if(Ancestor)
			LastAncestor:=Ancestor
		if(Control!=LastControl&&Control){
			MouseGetPos,,,Win,ClassNN
			ShowBorder(Control,-1)
			WinGetTitle,Title,ahk_id%Win%
			ControlGetText,Text,,ahk_id%Control%
			WinGet,EXE,ProcessName,ahk_id%Win%
			WinGetClass,Class,ahk_id%Win%
			ClassNN:=InStr(ClassNN,"ComboLBox")?RegExReplace(ClassNN,"i)ComboLBox","Combobox"):ClassNN
			for a,b in {(ClassNN):ClassNNHWND,(Text):TextHWND,"0x" Format("{:x}",Control):HWNDHWND,(TitleHWND):Title,(Title "`r`nahk_class " Class "`r`nahk_exe " EXE):ParentHWND}
				ControlSetText,,%a%,ahk_id%b%
			for a,b in TreeIDs{
				if(b=Control){
					TV_Modify(a,"Select Vis Focus")
					Break
				}
			}
		}LastControl:=Control
	}
}