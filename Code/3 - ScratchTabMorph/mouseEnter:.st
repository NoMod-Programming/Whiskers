
!ScratchTabMorph methodsFor: 'event handling' stamp: 'EMP 7/14/2017 15:58'!
mouseEnter: evt
	selected ifFalse: [
		mouseOver := true.
		self changed
	].! !