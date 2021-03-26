SetText(){
	ControlGetText,HWND,,ahk_id%HWNDHWND%
	ControlGetText,Text,,ahk_id%TextHWND%
	ControlSetText,,%Text%,% "ahk_id" HWND
}