
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/31/2005 16:39'!
createPolygonFromSVGPolygon: anElement
	"Create a polygon from the svg polygon."

	^self create: SVGPolygonMorph fromSVG: anElement! !
