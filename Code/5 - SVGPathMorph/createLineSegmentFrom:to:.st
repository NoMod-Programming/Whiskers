
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/12/2005 12:08'!
createLineSegmentFrom: start to: end
	"Create a line segment from the start to the end."

	self addSegment: (LineSegment from: start to: end).
	^end! !
