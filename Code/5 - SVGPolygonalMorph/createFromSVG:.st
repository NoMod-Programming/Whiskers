
!SVGPolygonalMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 13:54'!
createFromSVG: anElement
	"Create a polygon from the svg polygon."

	super createFromSVG: anElement.
	self createPointsFromSVG: anElement! !
