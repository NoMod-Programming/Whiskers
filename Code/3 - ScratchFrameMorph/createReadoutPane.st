
!ScratchFrameMorph methodsFor: 'intialization' stamp: 'EMP 7/13/2017 22:58'!
createReadoutPane
	"Create and add my presentation mode button, new sprite buttongs, and mouse readout pane."


	readoutPane :=  self makeXYReadout.

	"make pane sticky so clicking on it doesn't pick up entire frame"
	self addMorph: (readoutPane beSticky).
! !
