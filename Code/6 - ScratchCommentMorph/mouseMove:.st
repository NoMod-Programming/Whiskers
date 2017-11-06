
!ScratchCommentMorph methodsFor: 'event handling' stamp: 'EMP 11/5/2017 16:39'!
mouseMove: evt

	| p |
	evt hand newKeyboardFocus: nil.
	p := evt cursorPoint.

	isResizing ifTrue: [
		self width: ((p - self topLeft) + resizeOffset) x.
		self height: ((p - self topLeft) + resizeOffset) y.
		commentMorph width: self width - (resizeMorph width).
		commentMorph height: self height  - 12].
! !
