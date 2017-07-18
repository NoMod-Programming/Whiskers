
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/17/2017 14:30'!
viewerPageForCategory: aCategoryName
	"Answer a morph containing blocks for the given category for use in the given ScratchViewer."

	| bin x y |
	aCategoryName = 'Data' ifTrue: [^ self variablesPage].
	aCategoryName = 'Motion' ifTrue: [^ self viewerPageForMotion].
	aCategoryName = 'Sensing' ifTrue: [^ self viewerPageForSensing].
	aCategoryName = 'More Blocks' ifTrue: [^ self viewerPageForMore].

	bin := ScratchBlockPaletteMorph new.
	x := 12.
	y := 10.
	(self blocksFor: aCategoryName) do: [:blockOrSym |
		(blockOrSym = #-) | (blockOrSym = #~)
			ifTrue: [
				(blockOrSym = #-) ifTrue: [y := y + 15].  "insert a full space"
				(blockOrSym = #~) ifTrue: [y := y + 5]]  "insert a half space"
			ifFalse: [
				y := self createBlock: blockOrSym atPosition: x@y onPage: bin]].

	^ bin
! !
