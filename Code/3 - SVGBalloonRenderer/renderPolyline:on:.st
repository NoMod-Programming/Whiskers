
!SVGBalloonRenderer methodsFor: 'as yet unclassified' stamp: 'gvc 8/4/2005 10:14'!
renderPolyline: anSVGPolyine on: aCanvas
	"Render the given object on the canvas."
	
	| lineWidth lineColor|
	anSVGPolyine points isEmpty
		ifTrue: [^anSVGPolyine].
	lineWidth := anSVGPolyine composedStyle at: 'stroke-width'.
	lineColor := anSVGPolyine composedStyle at: 'stroke'.
	aCanvas asBalloonCanvas preserveStateDuring: [:bc|
		bc transformBy: anSVGPolyine transform during: [:balloonCanvas |
			balloonCanvas
				aaLevel: anSVGPolyine antialiasingLevel;
				drawOpenPolygon: anSVGPolyine points asArray
				color: Color transparent
				borderWidth: (lineWidth rounded max: 1)
				borderColor: lineColor]]! !
