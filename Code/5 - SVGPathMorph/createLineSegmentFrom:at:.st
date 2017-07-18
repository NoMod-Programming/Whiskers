
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/29/2005 00:34'!
createLineSegmentFrom: data at: aPoint
	"Create a line segment from the path data (stream) at the given position."

	|position|
	self createLineSegmentFrom: aPoint to: (position _ data first@data second).
	^position! !
