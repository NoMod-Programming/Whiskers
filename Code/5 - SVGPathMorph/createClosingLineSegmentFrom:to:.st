
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/8/2005 13:52'!
createClosingLineSegmentFrom: start to: end
	"Create a line segment from the start to the end."

	self addSegment: (SVGClosingLineSegment from: start to: end).
	^end! !
