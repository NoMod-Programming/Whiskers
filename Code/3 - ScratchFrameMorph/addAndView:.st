
!ScratchFrameMorph methodsFor: 'other' stamp: 'EMP 7/14/2017 15:05'!
addAndView: aSpriteMorph
	"Add given morph to the work pane and view it."

	| pos i p |
	aSpriteMorph center: workPane center.
	pos := self scratchObjects collect: [:o | o scratchStagePosition].
	i := 0.
	[pos includes: (p := (10 * i) asPoint)] whileTrue: [i := i + 1].
	workPane addMorphFront: aSpriteMorph.
	aSpriteMorph objName: aSpriteMorph nextInstanceName.
	aSpriteMorph scratchStagePosition: p.
	aSpriteMorph startStepping.
	workPane sprites addLast: aSpriteMorph.
	self view: aSpriteMorph tab: 'Scripts' category: 'Motion'.
! !
