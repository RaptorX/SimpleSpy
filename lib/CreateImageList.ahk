CreateImageList() {
	ImageList := IL_Create(32)
	IL_Add(ImageList, TreeIcons, 1)  ; Generic window icon
	IL_Add(ImageList, TreeIcons, 2)  ; Desktop (#32769)
	IL_Add(ImageList, TreeIcons, 3)  ; Dialog (#32770)
	IL_Add(ImageList, TreeIcons, 4)  ; Button
	IL_Add(ImageList, TreeIcons, 5)  ; CheckBox
	IL_Add(ImageList, TreeIcons, 6)  ; ComboBox
	IL_Add(ImageList, TreeIcons, 7)  ; DateTime
	IL_Add(ImageList, TreeIcons, 8)  ; Edit
	IL_Add(ImageList, TreeIcons, 9)  ; GroupBox
	IL_Add(ImageList, TreeIcons, 10) ; Hotkey
	IL_Add(ImageList, TreeIcons, 11) ; Icon
	IL_Add(ImageList, TreeIcons, 12) ; Link
	IL_Add(ImageList, TreeIcons, 13) ; ListBox
	IL_Add(ImageList, TreeIcons, 14) ; ListView
	IL_Add(ImageList, TreeIcons, 15) ; MonthCal
	IL_Add(ImageList, TreeIcons, 16) ; Picture
	IL_Add(ImageList, TreeIcons, 17) ; Progress
	IL_Add(ImageList, TreeIcons, 18) ; Radio
	IL_Add(ImageList, TreeIcons, 19) ; RichEdit
	IL_Add(ImageList, TreeIcons, 20) ; Separator
	IL_Add(ImageList, TreeIcons, 21) ; Slider
	IL_Add(ImageList, TreeIcons, 22) ; Status bar
	IL_Add(ImageList, TreeIcons, 23) ; Tab
	IL_Add(ImageList, TreeIcons, 24) ; Text
	IL_Add(ImageList, TreeIcons, 25) ; Toolbar
	IL_Add(ImageList, TreeIcons, 26) ; Tooltips
	IL_Add(ImageList, TreeIcons, 27) ; TreeView
	IL_Add(ImageList, TreeIcons, 28) ; UpDown
	IL_Add(ImageList, TreeIcons, 29) ; IE
	IL_Add(ImageList, TreeIcons, 30) ; Scintilla
	IL_Add(ImageList, TreeIcons, 31) ; ScrollBar
	IL_Add(ImageList, TreeIcons, 32) ; SysHeader
	Return ImageList
}