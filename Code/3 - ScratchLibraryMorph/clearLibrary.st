
!ScratchLibraryMorph methodsFor: 'initialization' stamp: 'EMP 7/14/2017 09:35'!
clearLibrary
	"Remove all library items. My step method will re-add items for existing objects."

	| sFrame |
	stagePane removeAllMorphs.
	scrollPane contents removeAllMorphs.
	scrollPane vScrollRelative: 0.


	sFrame := self ownerScratchFrame.
	buttonPane delete.
	buttonPane := self makeNewSpriteButtons: sFrame.
	self addMorph: buttonPane.

	self layoutChanged.
! !
