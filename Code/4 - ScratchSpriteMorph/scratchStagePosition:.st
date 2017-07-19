
!ScratchSpriteMorph methodsFor: 'accessing' stamp: 'EMP 7/18/2017 12:45'!
scratchStagePosition: aPoint
	"Set my position in the upside-down Scratch stage world"

	| newX newY p |
	newX := aPoint x.
	newX isNaN ifTrue: [newX := 0].
	newX isInfinite ifTrue: [newX := newX sign * 10000].
	newY := aPoint y.
	newY isNaN ifTrue: [newY := 0].
	newY isInfinite ifTrue: [newY := newY sign * 10000].

	p := newX @ newY negated.

	self referencePosition: p.
	self keepOnScreen.
! !
