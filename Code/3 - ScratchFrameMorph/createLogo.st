
!ScratchFrameMorph methodsFor: 'intialization' stamp: 'EMP 7/13/2017 19:20'!
createLogo
	"Create and the Scratch logo."

	logoMorph := SketchMorph withForm: (ScratchFrameMorph skinAt: #scratchLogo).
	logoMorph position: topPane position.
	topPane addMorph: logoMorph.
! !