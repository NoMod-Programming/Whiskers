
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/31/2005 16:39'!
createRectFromSVGRect: anElement
	"Create a rect from the svg rect."

	^self create: SVGRectMorph fromSVG: anElement! !
