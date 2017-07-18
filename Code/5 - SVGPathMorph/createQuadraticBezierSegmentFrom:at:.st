
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/29/2005 00:04'!
createQuadraticBezierSegmentFrom: data at: aPoint
	"Create a quadratic bezier segment from the path data (stream) at the given position."
	
	|position|
	self
		createQuadraticBezierSegmentFrom: aPoint
		via: data first@data second
		to: (position _ data third@data fourth).
	^position! !
