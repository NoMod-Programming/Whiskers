
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/31/2005 13:07'!
createFillFromSVGLinearGradient: anElement
	"Create a linear fill style from the given element."
	
	|idg p1 p2 ramp xlink linkFill trans |
	idg := (anElement attributeAt: 'id') withBlanksTrimmed.
	trans := self transformFromSVGAttribute: (anElement attributeAt: 'gradientTransform').
	ramp := self createRampFromSVGGradient: anElement.
	xlink := anElement attributeAt: 'xlink:href'.
	xlink notNil
		ifTrue: [xlink := xlink withBlanksTrimmed.
			linkFill := self getFill: xlink allButFirst.
			ramp isEmpty
				ifTrue: [ramp :=linkFill colorRamp].
			p1 := (anElement attributeAt: 'x1' ifAbsent: [linkFill origin x]) asSVGNumberOrPercentage@(anElement attributeAt: 'y1' ifAbsent: [linkFill origin y]) asSVGNumberOrPercentage.
			p2 := (anElement attributeAt: 'x2' ifAbsent: [linkFill direction x]) asSVGNumberOrPercentage@(anElement attributeAt: 'y2' ifAbsent: [linkFill direction y]) asSVGNumberOrPercentage]
		ifFalse: [
			p1 := (anElement attributeAt: 'x1' ifAbsent: [0]) asSVGNumberOrPercentage@(anElement attributeAt: 'y1' ifAbsent: [0]) asSVGNumberOrPercentage.
			p2 := (anElement attributeAt: 'x2' ifAbsent: [100]) asSVGNumberOrPercentage@(anElement attributeAt: 'y2' ifAbsent: [100]) asSVGNumberOrPercentage].
	p1 := trans transformPoint: p1.
	p2 := trans transformPoint: p2 .
	self setFill: idg to: ((SVGGradientFillStyle ramp: ramp)
		origin: p1;
		direction: p2 - p1;
		normal: nil;
		radial: false;
		units: (anElement attributeAt: 'gradientUnits' ifAbsent: [#userSpaceOnUse]) asSymbol;
		spread: (anElement attributeAt: 'spreadMethod' ifAbsent: [#pad]) asSymbol)! !
