; The color attribute in the following line sets the color     0x3FBBE3
ShowBorder(hWnd,Duration:=500,Color:="0xff0a0a",r:=3) { 
	Local x,y,w,h,Index
	static Window
	WinGetPos x, y, w, h, ahk_id %hWnd%
	if(!w)
		Return
	g_Borders := []
	while(A_Index<5){
		Index:=A_Index+90
		Gui,%Index%: +hWndhBorder -Caption +ToolWindow +AlwaysOnTop
		Gui,%Index%: Color, %Color%
		g_Borders.Push(hBorder)
	}
	for a,b in Window:=[[91,x-r,y-r,w+r+r,r],[92,x-r,y+h,w+r+r,r],[93,x-r,y,r,h],[94,x+w,y,r,h]]
		Gui,% b.1 ":Show",% "NA x" b.2 " y" b.3 " w" b.4 " h" b.5
	Gui,+AlwaysOnTop
	if(Duration!=-1&&Duration!="Flash"){
		Sleep,%Duration%
		while(A_Index<5){
			Index:=A_Index+90
			Gui,%Index%: Destroy
		}
	}else if(Duration="Flash"){
		SetTimer,Flash,-1
		return
		Flash:
		while(A_Index<8){
			Index:=A_Index
			for a,b in Window{
				Gui,% "+ToolWindow"
				Gui,% b.1 ":" (Mod(Index,2)?"Show":"Hide"),NA
			}
			Sleep,150
		}for a,b in Window
			Gui,% b.1 ":Destroy"
		return
	}
}