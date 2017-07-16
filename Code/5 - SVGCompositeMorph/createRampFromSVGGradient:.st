
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 08:32'!
createRampFromSVGGradient: anElement
	"Create a color ramp from the given element."
	
	|ramp stopStyle colour ic io stopColor stopOpacity offset|
	ramp := OrderedCollection new.
	anElement tagsNamed: #stop do: [:stop |
		stopColor := stop attributeAt: 'stop-color'.
		stopColor ifNotNil: [stopColor := Color fromCSS2String: stopColor].
		stopOpacity := stop attributeAt: 'stop-opacity'.
		offset := (stop attributeAt: 'offset') asSVGNumberOrPercentage.
		stopStyle := (stop attributeAt: 'style' ifAbsent: ['']) subStrings: ':;'.
		ic := stopStyle indexOf: 'stop-color'.
		ic > 0 ifTrue: [stopColor := Color fromCSS2String: (stopStyle at: ic + 1)].
		io := stopStyle indexOf: 'stop-opacity'.
		io > 0 ifTrue: [stopOpacity := (stopStyle at: io + 1) asSVGNumberOrPercentage].
		stopColor isNil ifTrue: [stopColor := Color black].
		stopOpacity isNil ifTrue: [stopOpacity := 1.0].
		colour := stopColor alpha: stopOpacity.
		ramp add: offset -> colour].
	^ramp! !
