
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/12/2005 12:18'!
adjustSegmentEnds
	"Adjust the end segments if not closed."

	|p1 p2 sw angle first last|
	self halt.
	self segments isEmpty
		ifTrue: [^self].
	first := self segments first.
	last := self segments last.
	first class == LineSegment
		ifTrue: [p1 := first start.
				p2 := first end.
				(self composedStyle at: 'stroke-linecap') = #butt
					ifTrue: [sw := (self composedStyle at: 'stroke-width') / 2.
						angle := (p1 bearingToPoint: p2) - 90.
						p1 := p1 + (Point r: sw degrees: angle).
						first from: p1 to: p2]].
	last class == LineSegment
		ifTrue: [p1 := last start.
				p2 := last end.
				(self composedStyle at: 'stroke-linecap') = #butt
					ifTrue: [sw := (self composedStyle at: 'stroke-width') / 2.
						angle := (p1 bearingToPoint: p2) - 90.
						p2 := p2 - (Point r: sw degrees: angle).
						last from: p1 to: p2]]! !
