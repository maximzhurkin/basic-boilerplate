App = do ->
	isTouch = () ->
		return 'ontouchstart' of window or navigator.maxTouchPoints

	init = () ->
		if isTouch then $('html').addClass 'no-touch'
		return
	{
		init: init
	}

$(document).ready ->
	App.init()
	Hello.init()

	return
