
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 11/4/2017 22:28'!
viewerPageForMore
	"Answer a morph containing my custom blocks."

	| page addButton x y |
	page := ScratchBlockPaletteMorph new
		color: ScratchFrameMorph palettePaneColor;
		borderWidth: 0.

	addButton := ScratchFrameMorph
		buttonLabel: 'Make a block' localized
		selector: #addCustom.

	x := 13.
	page addMorph: (addButton target: self; position: x@7).
	y := addButton bottom + 10.

	(self blocksFor: 'More Blocks') do: [:blockOrSym |
		(blockOrSym = #-) | (blockOrSym = #~)
			ifTrue: [
				(blockOrSym = #-) ifTrue: [y := y + 15].  "insert a full space"
				(blockOrSym = #~) ifTrue: [y := y + 5]]  "insert a half space"
			ifFalse: [
				y := self createBlock: blockOrSym atPosition: x@y onPage: page]].
	^ page
! !
