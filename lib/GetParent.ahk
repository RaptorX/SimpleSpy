GetParent(hWnd) {
	Return DllCall("GetParent", "Ptr", hWnd, "Ptr")
}