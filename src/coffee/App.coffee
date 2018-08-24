App = do ->

	addTouchClass = () ->
		md = new MobileDetect(window.navigator.userAgent)

		if md.mobile()
			$('html').addClass 'touch'
		else
			$('html').addClass 'no-touch'
		return

	init = () ->
		addTouchClass()

		return

	{
		init: init
	}
