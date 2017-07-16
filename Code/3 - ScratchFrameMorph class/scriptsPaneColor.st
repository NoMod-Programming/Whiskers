
!ScratchFrameMorph class methodsFor: 'utilities' stamp: 'EMP 7/13/2017 14:12'!
scriptsPaneColor

	| c |
	c := Color r: 217 g: 217 b: 217 range: 255.
	self isXO ifTrue: [c := c mixed: 0.8 with: Color white].
	^ c
! !
