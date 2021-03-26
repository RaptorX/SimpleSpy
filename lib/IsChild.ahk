IsChild(hWnd) {
	WinGet Style, Style, ahk_id %hWnd%
	Return Style & 0x40000000 ; WS_CHILD
}