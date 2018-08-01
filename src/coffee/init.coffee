$(document).ready ->
	App.init()
	Hello.init()

	return


window.onload = ->
	# init for carousels and slides

	setTimeout (->
		$('body').removeClass 'preload'
		return
	), 1000

	return