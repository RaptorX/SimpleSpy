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
		script.update(false, false)
	catch err
		msgbox % err.code ": " err.msg

	return
}