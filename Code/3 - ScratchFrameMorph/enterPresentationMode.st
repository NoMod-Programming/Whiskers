
!ScratchFrameMorph methodsFor: 'view mode' stamp: 'EMP 7/14/2017 12:59'!
enterPresentationMode
	"Go into presentation mode."

	| presenter |
	"ScratchPlugin pluginAvailable ifFalse: [
		self updateViewModeButtons.
		^ Beeper beep]."

	"if we're already in presentation mode, nothing more to do"
	self inPresentationViewMode ifTrue: [^ self].

	"remember the prior view mode for when we exit presentation"
	lastViewMode := viewMode.
	self setPresentationViewMode.

	"clean up any open dialogues"
	self closeDialogBoxes.
	
	"make a presenter moprh to wrap the stage, since we don't want all the other panes"
	presenter := ScratchPresenterMorph new frame: self.
	"remove the stage from the World"
	self delete.

	"set up the fullscreen display and blank  it all out before setting the presenter's size to suit"
	Display fillBlack.
	Project current fullScreenOn.
	World restoreDisplay.
	Display fillBlack.
	World assuredCanvas.  "re-allocate canvas after entering full-screen mode"
	presenter extent: Display extent.

	"add the presenter to the World and start morph stepping"
	World addMorphFront: presenter.
	World startSteppingSubmorphsOf: presenter.
	World activeHand newKeyboardFocus: nil.
	self updatePenPositions.

	World assuredCanvas.  "re-allocate canvas after entering full-screen mode"
	World fullRepaintNeeded.
	World displayWorldSafely.
! !
