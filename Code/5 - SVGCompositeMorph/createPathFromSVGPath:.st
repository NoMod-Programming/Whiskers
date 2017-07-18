
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/31/2005 16:38'!
createPathFromSVGPath: anElement
	"Create a path from the svg path."

	^self create: SVGPathMorph fromSVG: anElement! !
