
!SVGTextMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 11:12'!
createTSpanFromSVGTSpan: anElement
	"Create a text from the svg text."

	^self create: SVGTSpanMorph fromSVG: anElement! !
