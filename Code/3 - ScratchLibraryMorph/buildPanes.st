
!ScratchLibraryMorph methodsFor: 'initialization' stamp: 'EMP 7/14/2017 09:14'!
buildPanes
	"Build my scroll pane."

	| bin |
	stagePane := Morph new
		color: Color transparent;
		position: self position + (7@0).

	bin := ScratchSpriteLibraryMorph new
		color: Color transparent;
		borderWidth: 0.

	scrollPane := ScrollFrameMorph2 new
		color: Color transparent;
		contents: bin;
		showHorizontalScrollbar: false.

	spritePane := Morph new
		color: Color transparent;
		position: self position.
	buttonPane := self makeNewSpriteButtons: self ownerScratchFrame.

	self addMorph: spritePane.
	self addMorph: buttonPane.
	self addMorph: scrollPane.
	self addMorph: stagePane.
! !
