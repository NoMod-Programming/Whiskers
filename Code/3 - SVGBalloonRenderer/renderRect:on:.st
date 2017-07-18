
!SVGBalloonRenderer methodsFor: 'as yet unclassified' stamp: 'gvc 8/4/2005 10:13'!
renderRect: anSVGRect on: aCanvas
	"Render the given object on the canvas."

	|fill lineWidth lineColor|
	fill := anSVGRect composedFillStyle.
	lineWidth := (anSVGRect composedStyle at: 'stroke-width') rounded max: 1.
	lineColor := anSVGRect composedStyle at: 'stroke'.
	aCanvas asBalloonCanvas preserveStateDuring: [:bc|
		bc transformBy: anSVGRect transform during: [:balloonCanvas |
			balloonCanvas
				aaLevel: anSVGRect antialiasingLevel;
				drawRectangle: anSVGRect rectangle
				color: fill
				borderWidth: lineWidth
				borderColor: lineColor]]! !
