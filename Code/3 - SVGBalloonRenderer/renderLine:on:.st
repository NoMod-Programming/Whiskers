
!SVGBalloonRenderer methodsFor: 'as yet unclassified' stamp: 'gvc 8/4/2005 10:07'!
renderLine: anSVGLine on: aCanvas
	"Render the given object on the canvas."
	
	| lineWidth lineColor|
	lineWidth := (anSVGLine composedStyle at: 'stroke-width') rounded max: 1.
	lineColor := anSVGLine composedStyle at: 'stroke'.
	aCanvas asBalloonCanvas preserveStateDuring: [:bc|
		bc transformBy: anSVGLine transform during: [:balloonCanvas |
			balloonCanvas
				aaLevel: anSVGLine antialiasingLevel;
				drawPolygon: {anSVGLine rectangle origin. anSVGLine rectangle corner}
				color: lineColor
				borderWidth: lineWidth
				borderColor: lineColor]]! !
