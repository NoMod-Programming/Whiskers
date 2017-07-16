
!ScratchThumbnailMorph methodsFor: 'event handling' stamp: 'EMP 7/13/2017 13:32'!
mouseDown: evt

	evt shiftPressed ifTrue: [
		target ifNotNil: [target makeVisible].
		^ self].

	evt hand waitForClicksOrDrag: self event: evt.
! !
