
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/31/2005 16:40'!
createTextFromSVGText: anElement
	"Create a text from the svg text."

	^self create: SVGTextMorph fromSVG: anElement! !
