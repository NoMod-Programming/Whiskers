
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/3/2005 15:44'!
createArcSegmentFrom: data at: aPoint
	"Create an arc segment from the path data at the given position.
	Evil apporximation required for compatability with Balloon - no arcs!!"

	|position radii angle sweep large sp cp pd num root s cd c theta1 dtheta nSegs delta t ps|
	radii := (data first@data second) abs.
	angle := data third degreesToRadians.
	large := data fourth = 1.
	sweep := data fifth = 1.
	position  := data sixth@data seventh.
	ps := aPoint.

	position = aPoint
		ifTrue: [^position].

	(radii x = 0 or: [radii y = 0])
		ifTrue: [^self createLineSegmentFrom: aPoint to: position].

	sp := angle sin.
	cp := angle cos.
	pd := (cp * (ps x - position x) + (sp * (ps y - position y)) @
		(sp negated * (ps x - position x) + (cp * (ps y - position y)))) / 2.
	num := radii x squared * radii y squared - (radii x squared * pd y squared) - (radii y squared * pd x squared).
	num < 0
		ifTrue: [s :=  (1 - (num / (radii x squared * radii y squared))) sqrt.
				radii := radii * s.
				root := 0]
		ifFalse: [root := (large = sweep ifTrue: [-1] ifFalse: [1]) *
					(num / (radii x squared * pd y squared + (radii y squared * pd x squared))) sqrt].
	cd := root * radii * pd transposed / radii transposed.
	cd := cd x @ cd y negated.
	c := cp * cd x - (sp * cd y) + (ps x + position x / 2) @
		(sp * cd x + (cp * cd y) + (ps y + position y / 2)).
	theta1 := 1@0 angleWith: pd - cd / radii.
	dtheta := pd - cd / radii angleWith: pd negated - cd / radii.
	(sweep not and: [dtheta > 0])
		ifTrue: [dtheta := dtheta  - (2 * Float pi)]
		ifFalse: [(sweep and: [dtheta < 0])
				ifTrue: [dtheta := dtheta + (2 * Float pi)]].
	nSegs := (dtheta / (Float pi /2)) abs ceiling.
	delta := dtheta / nSegs.
	t := 8 / 3 * (delta / 4) sin squared / (delta / 2) sin.
	nSegs timesRepeat: [|ct1 st1 theta2 ct2 st2 pe ds de|
		ct1 := theta1 cos.
		st1 := theta1 sin.
		theta2 := theta1 + delta.
		ct2 := theta2 cos.
		st2 := theta2 sin.
		pe := cp * radii x * ct2 - (sp * radii y * st2) + c x @
			(sp * radii x * ct2 + (cp * radii y  * st2) + c y).
		 ds := t * ((cp negated * radii x * st1 - (sp * radii y * ct1)) @
			(sp negated  * radii x * st1 + (cp * radii y*ct1))).
		de := t * ((cp * radii x * st2 + (sp * radii y * ct2)) @
			(sp  * radii x * st2 - (cp * radii y*ct2))).
		self
			createCubicBezierSegmentFrom: ps
			via: ps + ds
			and: pe + de
			to: pe.
		theta1 := theta2.
		ps := pe].
	^position! !
