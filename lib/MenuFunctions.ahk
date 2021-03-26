Reload()
{
	Reload
}

Exit()
{
	ExitApp, 0
}

About()
{
	script.About()
	return
}

update()
{
	try
		script.update("https://raw.githubusercontent.com/RaptorX/SimpleSpy/master/ver"
					 ,"https://github.com/RaptorX/SimpleSpy/archive/refs/tags/latest.zip")
	catch err
		msgbox % err.code ": " err.msg

	return
}