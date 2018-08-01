App = do ->
	isTouch = () ->
		md = new MobileDetect(window.navigator.userAgent)

		if md.mobile()
			return true
		else
			return false

	init = () ->
		if isTouch then $('html').addClass 'no-touch'
		return

	{
		init: init
	}
