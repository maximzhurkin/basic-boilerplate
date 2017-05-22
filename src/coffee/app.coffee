# Инициализируем загрузчик шрифтов

WebFont.load google:
	families: [
		'Gabriela:latin,cyrillic'
		'Roboto:100,300,700:latin,cyrillic'
	]

# Если кликнули вне элемента
# $(document).click (event) ->
# 	if !$(event.target).closest('.el').length
# 		# hide element...
# 	return

# Slides
# $('.slides.owl-carousel').owlCarousel
# 	items: 1
# 	nav: true
# 	dots: true
# 	loop: true
# 	autoplay: true
# 	autoplayTimeout: 5000
# 	autoplaySpeed: 1000
# 	autoplay: true
# 	navSpeed: 1000
# 	lazyLoad: true
# 	navText: ['<i class="icon-arrow-left"></i>', '<i class="icon-arrow-right"></i>']
# 	responsiveClass: true
# 	responsive:
# 		0: autoplay: false
# 		600: autoplay: true

# Carousel
# $('.carousel.owl-carousel').owlCarousel
# 	items: 8
# 	nav: true
# 	dots: true
# 	loop: true
# 	autoplay: true
# 	autoplayTimeout: 3000
# 	autoplaySpeed: 1000
# 	callbacks: true
# 	navSpeed: 1000
# 	lazyLoad: true
# 	navText: ['<i class="icon-arrow-left"></i>', '<i class="icon-arrow-right"></i>']
# 	responsiveClass: true
# 	responsive:
# 		0: items: 1
# 		480: items: 3
# 		768: items: 5
# 		1024: items: 7
# 		1280: items: 9

# Product slides with thumbs
# productSlides = $('.product-images.owl-carousel')
# productSlides.on 'initialized.owl.carousel', (event) ->
# 	productSlides.find('.product-thumb:first').addClass 'active'
# 	return
# productSlides.owlCarousel
# 	items: 1
# 	nav: false
# 	dots: false
# 	loop: false
# 	autoplay: false
# 	callbacks: true
# 	lazyLoad: true
# 	navText: ['','']
# 	responsiveClass: true
# productSlides.on 'changed.owl.carousel', (event) ->
# 	current = event.item.index
# 	$('section.product .product-thumb').removeClass 'active'
# 	$('section.product .product-thumb').each ->
# 		if $(@).data('id') == current
# 			$(@).addClass 'active'
# 		return
# 	return
# $('.product-thumb a').click ->
# 	id = $(this).closest('.product-thumb').data('id')
# 	productSlides.trigger 'to.owl.carousel', id
# 	false

# equal height
# $('.el').matchHeight
# 	byRow: false
# 	property: 'height'

# Styled google map (#map)
# $.getJSON '/assets/json/map.json', (style) ->
# 	key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
# 	pinTitle = 'Title'
# 	$.getScript 'http://maps.google.com/maps/api/js?sensor=false&key=' + key, ->
# 		latLng =
# 			lat: 58.522393
# 			lng: 31.273614
# 		map = new (google.maps.Map)(document.getElementById('map'),
# 			zoom: 14
# 			center: new (google.maps.LatLng)(latLng)
# 			mapTypeId: google.maps.MapTypeId.ROADMAP
# 			scrollwheel: false
# 			mapTypeControl: false
# 			zoomControl: true
# 			zoomControlOptions: position: google.maps.ControlPosition.RIGHT_TOP
# 			streetViewControl: false
# 			styles: style
# 		infowindow = new (google.maps.InfoWindow)(content: pinTitle)
# 		marker = new (google.maps.Marker)(
# 			position: latLng
# 			map: map)
# 		marker.addListener 'click', ->
# 			infowindow.open map, marker
# 			return
# 		infowindow.open map, marker
# 		return
