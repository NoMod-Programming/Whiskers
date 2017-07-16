
!SVGBalloonRenderer methodsFor: 'as yet unclassified' stamp: 'gvc 8/4/2005 10:04'!
renderPath: anSVGPath on: aCanvas
	"Render the given object on the canvas."

	|fill lineWidth lineColor|
	anSVGPath segments isEmpty
		ifTrue: [^self].
	fill := anSVGPath composedFillStyle.
	lineWidth := (anSVGPath composedStyle at: 'stroke-width') rounded max: 1.
	lineColor := anSVGPath composedStyle at: 'stroke'.
	aCanvas asBalloonCanvas preserveStateDuring: [:bc|
		bc transformBy: anSVGPath transform during: [:balloonCanvas |
			balloonCanvas
				aaLevel: anSVGPath antialiasingLevel;
				drawGeneralSegments: anSVGPath segments
				color: fill
				borderWidth: lineWidth
				borderColor: lineColor]]! !
