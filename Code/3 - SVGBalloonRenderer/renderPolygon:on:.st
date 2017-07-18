
!SVGBalloonRenderer methodsFor: 'as yet unclassified' stamp: 'gvc 8/4/2005 10:17'!
renderPolygon: anSVGPolygon on: aCanvas
	"Render the given object on the canvas."
	
	|fill lineWidth lineColor|
	anSVGPolygon points isEmpty
		ifTrue: [^anSVGPolygon].
	fill := anSVGPolygon composedFillStyle.
	lineWidth := anSVGPolygon composedStyle at: 'stroke-width'.
	lineColor := anSVGPolygon composedStyle at: 'stroke'.
	aCanvas asBalloonCanvas preserveStateDuring: [:bc|
		bc transformBy: anSVGPolygon transform during: [:balloonCanvas |
			balloonCanvas
				aaLevel: anSVGPolygon antialiasingLevel;
				drawPolygon: anSVGPolygon points asArray
				color: fill
				borderWidth: (lineWidth rounded max: 1)
				borderColor: lineColor]]! !
