IsWindowVisible(hWnd) {
	Return DllCall("IsWindowVisible", "Ptr", hWnd)
}