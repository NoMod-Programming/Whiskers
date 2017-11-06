
!ScratchFrameMorph class methodsFor: 'colors' stamp: 'EMP 11/4/2017 22:20'!
scriptsPaneColor

	| c |
	c := Color r: 217 g: 217 b: 217 range: 255.
	self isXO ifTrue: [c := c mixed: 0.8 with: Color white].
	^ c
! !
