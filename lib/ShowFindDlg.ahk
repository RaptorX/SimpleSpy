ShowFindDlg:
If (FindDlgExist) {
	Gui Find: Show
} Else {
	Gui Find: New, LabelFind hWndhFindDlg
	Gui,+Owner1 +AlwaysOnTop
	Gui Font, s9, Segoe UI
	Gui Color, White
	
	Gui Add, Text, x15 y16 w81 h23 +0x200, Text or Title:
	Gui Add, Edit, hWndhEdtFindByText vEdtFindByText gFindWindow x144 y17 w286 h21
	Gui Add, CheckBox, vChkFindRegEx x441 y16 w120 h23, Regular Expression
	Gui Add, Text, x15 y54 w79 h23 +0x200, Class Name:
	Gui Add, ComboBox, vCbxFindByClass gFindWindow x144 y54 w286
	Gui Add, Text, x15 y93 w110 h23 +0x200, Process ID or Name:
	Gui Add, ComboBox, vCbxFindByProcess gFindWindow x144 y93 w286
	
	Gui Add, ListView, hWndhFindList gFindListHandler x10 y130 w554 h185 +LV0x14000
        , hWnd|Class|Text|Process
	LV_ModifyCol(1, 0)
	LV_ModifyCol(2, 133)
	LV_ModifyCol(3, 285)
	LV_ModifyCol(4, 112)
	
	Gui Add, Text, x-1 y329 w576 h49 +Border -Background
	Gui Add, Button, gFindOK x381 y342 w88 h25 Default, &OK
	Gui Add, Button, gFindClose x477 y342 w88 h25, &Cancel
	
	Gui Show, w574 h377, Find Window
	SetExplorerTheme(hFindList)
	
	FindDlgExist := True
}

    ; Unique class names
Global Classes := []
WinGet WinList, List
Loop %WinList% {
	hThisWnd := WinList%A_Index%
	WinGetClass WClass, ahk_id %hThisWnd%
	AddUniqueClass(WClass)
	
	WinGet ControlList, ControlListHwnd, ahk_id %hThisWnd%
	Loop Parse, ControlList, `n
	{
		WinGetClass CClass, ahk_id %A_LoopField%
		AddUniqueClass(CClass)
	}
}

ClassList := ""
Loop % Classes.Length()  {
	ClassList .= Classes[A_Index] . "|"
}

GuiControl,, CbxFindByClass, %ClassList%

    ; Unique process names
Processes := []
For Process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process") {
	If (Process.ProcessID < 10) {
		Continue
	}
	
	Unique := True
	Loop % Processes.Length() {
		If (Process.Name == Processes[A_Index]) {
			Unique := False
			Break
		}
	}
	
	If (Unique) {
		Processes.Push(Process.Name)
	}
}

ProcList := ""
MaxItems := Processes.Length()
Loop %MaxItems%  {
	ProcList .= Processes[MaxItems - A_Index + 1] . "|"
}

GuiControl,, CbxFindByProcess, %ProcList%
Return
SetExplorerTheme(hWnd) {
	DllCall("UxTheme.dll\SetWindowTheme", "Ptr", hWnd, "WStr", "Explorer", "Ptr", 0)
}
AddUniqueClass(ClassName) {
	Local Unique := True
	Loop % Classes.Length() {
		If (ClassName == Classes[A_Index]) {
			Unique := False
			Break
		}
	}
	
	If (Unique) {
		Classes.Push(ClassName)
	}
}

FindEscape:
FindClose:
Gui Find: Hide
Return

FindWindow:
Gui Find: Submit, NoHide

Gui ListView, %hFindList%
GuiControl -Redraw, %hFindList%
LV_Delete()

WinGet WinList, List
Loop %WinList% {
	hThisWnd := WinList%A_Index%
	If (hThisWnd == hFindDlg) {
		Continue
	}
	
	WinGetClass WClass, ahk_id %hThisWnd%
	WinGetTitle WTitle, ahk_id %hThisWnd%
	WinGet WProcess, ProcessName, ahk_id %hThisWnd%
	WinGet WProcPID, PID, ahk_id %hThisWnd%
	
	If (MatchCriteria(WTitle, WClass, IsNumber(CbxFindByProcess) ? WProcPID : WProcess)) {
		LV_Add("", hThisWnd, WClass, WTitle, WProcess)
	}
	
	WinGet ControlList, ControlListHwnd, ahk_id %hThisWnd%
	Loop Parse, ControlList, `n
	{
		ControlGetText CText,, ahk_id %A_LoopField%
		WinGetClass CClass, ahk_id %A_LoopField%
		WinGet CProcess, ProcessName, ahk_id %A_LoopField%
		WinGet CProcPID, PID, ahk_id %A_LoopField%
		
		If (MatchCriteria(CText, CClass, IsNumber(CbxFindByProcess) ? CProcPID : CProcess)) {
			LV_Add("", A_LoopField, CClass, CText, CProcess)
		}
	}
}

GuiControl +Redraw, %hFindList%
Return

MatchCriteria(Text, Class, Process) {
	Global
	
	If (EdtFindByText != "") {
		If (ChkFindRegEx) {
			If (RegExMatch(Text, EdtFindByText) < 1) {
				Return False
			}
		} Else {
			If (!InStr(Text, EdtFindByText)) {
				Return False
			}
		}
	}
	
	If (CbxFindByClass != "" && !InStr(Class, CbxFindByClass)) {
		Return False
	}
	
	If (CbxFindByProcess != "") {
		Return IsNumber(Process) ? CbxFindByProcess == Process : InStr(Process, CbxFindByProcess)
	}
	
	Return True
}

FindOK:
Gui ListView, %hFindList%
LV_GetText(hWnd, LV_GetNext())
GuiControl, 
, EdtHandle, %hWnd%
WinActivate ahk_id %hSpyWnd%
Gui Find: Hide
Return

FindListHandler:
If (A_GuiEvent == "DoubleClick") {
	GoSub FindOK
}
Return
IsNumber(n) {
	If n Is Number
		Return True
	Return False
}