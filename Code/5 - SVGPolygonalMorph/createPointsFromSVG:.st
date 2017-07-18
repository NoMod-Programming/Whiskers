
!SVGPolygonalMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 13:54'!
createPointsFromSVG: anElement
	"Create the points from the polygon."

	self points: (self pointDataFromSVG: anElement)
! !
