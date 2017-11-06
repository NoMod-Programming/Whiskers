
!VariableArgMorph methodsFor: 'event handling' stamp: 'EMP 11/5/2017 18:22'!
presentMenu
	"Let the user select a Scratch object or the special value #mouse."

	| frame sel menu frameHeight receiver |
	(frame := self ownerScratchFrame) ifNil: [^ self].

	(owner isCommandBlockMorph) ifTrue: [sel := owner selector].

	receiver := owner receiver.

	menu := ScratchMenuMorph new itemHeight: 22; color: color..

	receiver vars valuesDo: [:scratchVar |
		menu add: scratchVar varName localized target: self selector: #setArgFromMenuChoice: argument: scratchVar
	].
	(receiver isScratchStageMorph) ifFalse: [ | vars |
		vars := (receiver ownerThatIsA: ScratchStageMorph) vars.
		(vars size > 0) ifTrue: [menu addLine].
		vars valuesDo: [:scratchVar |
			menu add: scratchVar varName localized target: self selector: #setArgFromMenuChoice: argument: scratchVar
		].
	].


	"roughly how many entries could fit into 3/4 of my frame's height?"
	frameHeight := (self ownerScratchFrame) ifNil:[300] ifNotNil:[:thing| thing height].
	 menu limitHeightTo: frameHeight * 3/4.

	menu popUpInWorld
! !
