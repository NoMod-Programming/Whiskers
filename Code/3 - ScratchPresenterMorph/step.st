
!ScratchPresenterMorph methodsFor: 'stepping' stamp: 'EMP 7/16/2017 20:34'!
step
	"Run each process until it gives up control, then filter out any processes that have terminated."

	| screenExtent |
	screenExtent := DisplayScreen actualScreenSize.
	((self position = (0@0)) and: [self extent = screenExtent]) ifFalse: [
		self position: 0@0.
		^ self extent: screenExtent].

	stage stepServers.
	self processWhenConditions.
	"self processKeyboardEvents. - morphic event handling covers this - see ScratchPresentationMorph>keyboardHandler & keyStroke:"
	stage stepProcesses.
	stage step.
	self stepSubmorphs.
	offscreenWorld incrRedraw.

	stage processesToRun size > 0
		ifTrue: [flagButton on]
		ifFalse: [flagButton off].
! !
