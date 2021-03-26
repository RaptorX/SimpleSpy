FindToolHandler(){
	DllCall("SetCapture","Ptr",hSpyWnd)
	hOldCursor:=DllCall("SetCursor","Ptr",hCrossHair,"Ptr")
	GuiControl,,Static1,%Bitmap2%
	Moving:=1
	return
}