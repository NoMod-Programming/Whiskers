
!SVGBalloonRenderer methodsFor: 'as yet unclassified' stamp: 'gvc 10/3/2005 16:19'!
renderText: anSVGText on: aCanvas
	"Render the given object on the canvas."

	|fill textFont anchor offset trans|
	trans := anSVGText transformFrom: anSVGText world.
	fill := anSVGText composedFontFillStyle.
	textFont := anSVGText fontToUse.
	anchor := anSVGText composedStyle at: 'text-anchor'.
	offset := 0@textFont ascent.
	anchor  = 'middle'
		ifTrue: [offset := (textFont widthOfString: anSVGText text) // 2@textFont ascent].
	anchor  = 'end'
		ifTrue: [offset := (textFont widthOfString: anSVGText text)@textFont ascent].
	aCanvas asBalloonCanvas preserveStateDuring: [:bc|
		bc copy
			aaLevel: anSVGText antialiasingLevel;
			drawString: anSVGText text
			at: (trans transformPoint: anSVGText location) - offset
			font: textFont
			color: fill]! !
