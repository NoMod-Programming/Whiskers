
!BlockMorph methodsFor: 'event handling' stamp: 'EMP 7/17/2017 12:30'!
startDrag: evt

	|  rootForGrab |
	owner isAlignmentMorph ifTrue: [^ owner owner startDrag: evt].
	evt hand scratchToolType ifNil: [
		rootForGrab  :=  self rootForGrabOf: self.
		rootForGrab ifNil: [^ self].
		evt hand grabMorph: rootForGrab].

	self handleToolEvent: evt
! !
