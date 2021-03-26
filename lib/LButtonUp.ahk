LButtonUp(x*){
	if(Moving){
		GuiControl,,Static1,%Bitmap1%
		Moving:=0,DllCall("ReleaseCapture"),DllCall("SetCursor","Ptr",hOldCursor),ShowBorder(MouseMove("Control",0,0,0),1000) ;the 1000 is the duration of how long the Border stays visible
	}
} ;*[LButtonUp]