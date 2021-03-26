Tree(hParentWnd, ParentID) {
	WinGet WinList, ControlListHwnd, ahk_id %hParentWnd%
	Loop Parse, WinList, `n
	{
		If (GetParent(A_LoopField) != hParentWnd) {
			Continue
		}
		
		WinGetClass Class, ahk_id %A_LoopField%
		If (IsChild(A_LoopField)) {
			ControlGetText Text,, ahk_id %A_LoopField%
		} Else {
			WinGetTitle Text,, ahk_id %A_LoopField%
		}
		Text:=StrLen(Text)>50?SubStr(Text,1,50) "..":Text
		
		If (Text != "") {
			Text := " - " . Text
		}
		
		Invisible := !IsWindowVisible(A_LoopField)
		
		If (!g_TreeShowAll && Invisible) {
			Continue
		}
		
		If (Invisible) {
			Text .= " (hidden)"
		}
		Icon:=GetWindowIcon(A_LoopField,Class)
		TreeIDs[(TV:=TV_Add(Class Text,ParentID,"Icon" Icon))] := A_LoopField
		Tree(A_LoopField,TV)
	}
}