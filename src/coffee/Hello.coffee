Hello = do ->
	say = (message) ->
		console.log message
		return

	init = () ->
		say 'hello'
		return
		
	{
		init: init
	}