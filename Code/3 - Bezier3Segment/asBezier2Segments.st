
!Bezier3Segment methodsFor: '*SVG-Morphic' stamp: 'gvc 10/3/2005 10:40'!
asBezier2Segments
	"Demote a cubic bezier to a collection of approximating quadratic beziers."

	| curves segs step prev |
	curves := self bezier2SegmentCount: 0.5.
	segs := OrderedCollection new: curves.
	step := 1.0 / (curves * 2).
	prev := start.
	1 to: curves do: [:c |
		segs
			add: (Bezier2Segment
					from: prev
					via: (4 * (self valueAt: (c*2-1)*step) - prev - (prev := self valueAt: (c*2)*step)) / 2
					to: prev)].
	^segs.
	! !
