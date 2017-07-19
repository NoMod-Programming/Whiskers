
!DialogBoxMorph methodsFor: 'event handling' stamp: 'EMP 7/18/2017 11:10'!
mouseDown: evt
	evt hand newKeyboardFocus: self.
	evt hand waitForClicksOrDrag: self event: evt! !
