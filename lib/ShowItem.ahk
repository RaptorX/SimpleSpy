ShowItem(){
	Control:=TreeIDs[TV_GetSelection()]
	if(A_GuiEvent~="i)(S|Normal)"&&Control){
		ShowBorder(Control,"Flash"),Win:=GetAncestor(Control)
		WinGetTitle,Title,ahk_id%Win%
		ControlGetText,Text,,ahk_id%Control%
		WinGet,EXE,ProcessName,ahk_id%Win%
		WinGetClass,Class,ahk_id%Win%
		ClassNN:=Control_GetClassNN(Win,Control)
		VarSetCapacity( charbuff, 256, 0 )
		ClassNN:=InStr(ClassNN,"ComboLBox")?RegExReplace(ClassNN,"i)ComboLBox","Combobox"):ClassNN
		for a,b in {(ClassNN):ClassNNHWND,(Text):TextHWND,"0x" Format("{:x}",Control):HWNDHWND,(TitleHWND):Title,(Title "`r`nahk_class " Class "`r`nahk_exe " EXE):ParentHWND}
			ControlSetText,,%a%,ahk_id%b%
	}
	
}