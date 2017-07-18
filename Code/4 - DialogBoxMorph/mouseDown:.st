
!DialogBoxMorph methodsFor: 'event handling' stamp: 'EMP 7/17/2017 12:02'!
mouseDown: evt
	evt hand newKeyboardFocus: self.
evt hand waitForClicksOrDrag: self event: evt! !
