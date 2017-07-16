
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 14:13'!
createSegmentsFromSVG: anElement
	"Create the segments from the path."

	|data position c d subpathStartPosition initialPosition lastCubicControl lastQuadraticControl|
	c := nil.
	initialPosition := nil.
	data := self pathDataFromSVG: anElement.
	position := 0@0.
	data do: [:cmd |
		((cmd = $S or: [cmd = $s]) and: ['CcSs' includes: c not])
			ifTrue: [lastCubicControl := position].
		((cmd = $T or: [cmd = $t]) and: ['QqTt' includes: c not])
			ifTrue: [lastQuadraticControl := position].
		c := cmd key.
		d := cmd value.
		c = $M
			ifTrue: [position := d first@d second.
					initialPosition isNil
						ifTrue: [initialPosition := position].			
					subpathStartPosition := position].
		c = $m
			ifTrue: [initialPosition isNil
						ifTrue: [position := d first@d second. initialPosition :=  position]
						ifFalse: [position := position + (d first@d second)].
					subpathStartPosition := position].
		c = $A
			ifTrue: [position := self createArcSegmentFrom: d at: position].
		c = $a
			ifTrue: [d at: 1 put: (d first + position x).
					d at: 2 put: (d second + position y).
					d at: 6 put: (d sixth + position x).
					d at: 7 put: (d seventh + position y).
					position := self createArcSegmentFrom: d at: position].
		c = $L
			ifTrue: [position := self createLineSegmentFrom: d at: position].
		c = $l
			ifTrue: [d at: 1 put: (d first + position x).
					d at: 2 put: (d second + position y).
					position := self createLineSegmentFrom: d at: position].
		c = $H
			ifTrue: [d add: position y.
					position := self createLineSegmentFrom: d at: position].
		c = $h
			ifTrue: [d at: 1 put: (d first + position x).
					d add: position y.
					position := self createLineSegmentFrom: d at: position].
		c = $V
			ifTrue: [d addFirst: position x.
					position := self createLineSegmentFrom: d at: position].
		c = $v
			ifTrue: [d addFirst: position x.
					d at: 2 put: (d second + position y).
					position := self createLineSegmentFrom: d at: position].
		c = $C
			ifTrue: [lastCubicControl := d third@d fourth.
					position := self createCubicBezierSegmentFrom: d at: position].
		c = $c
			ifTrue: [d at: 1 put: (d first + position x).
					d at: 2 put: (d second + position y).
					d at: 3 put: (d third + position x).
					d at: 4 put: (d fourth + position y).
					lastCubicControl := d third@d fourth.
					d at: 5 put: (d fifth + position x).
					d at: 6 put: (d sixth + position y).
					position := self createCubicBezierSegmentFrom: d at: position].
		c = $S
			ifTrue: [lastCubicControl := lastCubicControl reflectedAbout: position.
					d addFirst: lastCubicControl y.
					d addFirst: lastCubicControl x.
					lastCubicControl := d third@d fourth.
					position := self createCubicBezierSegmentFrom: d at: position].
		c = $s
			ifTrue: [lastCubicControl := lastCubicControl reflectedAbout: position.
					d addFirst: lastCubicControl y.
					d addFirst: lastCubicControl x.
					d at: 3 put: (d third + position x).
					d at: 4 put: (d fourth + position y).
					lastCubicControl := d third@d fourth.
					d at: 5 put: (d fifth + position x).
					d at: 6 put: (d sixth + position y).
					position := self createCubicBezierSegmentFrom: d at: position].
		c = $Q
			ifTrue: [lastQuadraticControl := d first@d second .
					position := self createQuadraticBezierSegmentFrom: d at: position].
		c = $q
			ifTrue: [d at: 1 put: (d first + position x).
					d at: 2 put: (d second + position y).
					lastQuadraticControl := d first@d second.
					d at: 3 put: (d third + position x).
					d at: 4 put: (d fourth + position y).
					position := self createQuadraticBezierSegmentFrom: d at: position].
		c = $T
			ifTrue: [lastQuadraticControl := lastQuadraticControl reflectedAbout: position.
					d addFirst: lastQuadraticControl y.
					d addFirst: lastQuadraticControl x.
					lastQuadraticControl := d first@d second.
					position := self createQuadraticBezierSegmentFrom: d at: position].
		c = $t
			ifTrue: [lastQuadraticControl := lastQuadraticControl reflectedAbout: position.
					d addFirst: lastCubicControl y.
					d addFirst: lastCubicControl x.
					lastQuadraticControl := d first@d second.
					d at: 3 put: (d third + position x).
					d at: 4 put: (d fourth + position y).
					position := self createQuadraticBezierSegmentFrom: d at: position].
		(c = $z and: [position ~= subpathStartPosition])
			ifTrue: [position := self createClosingLineSegmentFrom: position to: subpathStartPosition]].
	(c ~=$z and: [position ~= subpathStartPosition])
		ifTrue: [position := self createFixupLineSegmentFrom: position to: subpathStartPosition]! !
