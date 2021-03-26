TreeVis(){
	static Size:=1
	if((Size:=!Size))
		Gui,Show,h%WinHeight%
	else{
		Gui,Show,AutoSize
		ControlFocus,SysTreeView321,%ID%
	}
}