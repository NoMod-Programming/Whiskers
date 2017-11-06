
!ScratchFrameMorph class methodsFor: 'colors' stamp: 'EMP 11/4/2017 22:20'!
palettePaneColor

	| c |
	c := Color r: 230 g: 232 b: 232 range: 255.
	self isXO ifTrue: [c := c mixed: 0.75 with: Color white].
	^ c
! !
