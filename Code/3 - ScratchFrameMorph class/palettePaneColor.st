
!ScratchFrameMorph class methodsFor: 'utilities' stamp: 'EMP 7/13/2017 16:04'!
palettePaneColor

	| c |
	c := Color r: 230 g: 232 b: 232 range: 255.
	self isXO ifTrue: [c := c mixed: 0.75 with: Color white].
	^ c
! !