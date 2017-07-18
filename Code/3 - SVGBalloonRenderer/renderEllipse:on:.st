
!SVGBalloonRenderer methodsFor: 'as yet unclassified' stamp: 'gvc 8/4/2005 10:15'!
renderEllipse: anSVGEllipse on: aCanvas
	"Render the given object on the canvas."
	
	|fill lineWidth lineColor|
	fill := anSVGEllipse composedFillStyle.
	lineWidth := (anSVGEllipse composedStyle at: 'stroke-width') rounded max: 1.
	lineColor := anSVGEllipse composedStyle at: 'stroke'.
	aCanvas asBalloonCanvas preserveStateDuring: [:bc|
		bc transformBy: anSVGEllipse transform during: [:balloonCanvas |
			balloonCanvas
				aaLevel: anSVGEllipse antialiasingLevel;
				drawOval: anSVGEllipse rectangle
				color: fill
				borderWidth: lineWidth
				borderColor: lineColor]]! !
