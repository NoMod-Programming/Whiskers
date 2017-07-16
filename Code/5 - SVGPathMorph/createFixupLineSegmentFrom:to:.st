
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 14:13'!
createFixupLineSegmentFrom: start to: end
	"Create a line segment from the start to the end."

	self addSegment: (SVGFixupLineSegment from: start to: end).
	^end! !
