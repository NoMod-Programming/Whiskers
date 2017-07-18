
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/28/2005 16:00'!
createCubicBezierSegmentFrom: start via: control1 and: control2 to: end
	"Create a cubic bezier segment from the start to the end via the control points."

	(control1 = start or: [control2 = end])
		ifTrue: [control1 = start
				ifTrue: [control2 = end
						ifTrue: [self createLineSegmentFrom: start to: end]
						ifFalse: [self createQuadraticBezierSegmentFrom: start via: control2 to: end]]
				ifFalse: [self createQuadraticBezierSegmentFrom: start via: control1 to: end]]
		ifFalse: [self addSegment: (Bezier3Segment from: start via: control1 and: control2 to: end)]! !
