
!ScratchTabMorph methodsFor: 'event handling' stamp: 'EMP 7/14/2017 15:59'!
mouseLeave: evt
	selected ifFalse: [
		mouseOver := false.
		self changed
	].! !
