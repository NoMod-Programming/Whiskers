
!NewVariableDialog methodsFor: 'initialization' stamp: 'EMP 11/5/2017 20:58'!
initialize

	| label1 label2 |
	super initialize.
	spriteSpecificFlag := false.

	radioButtons := AlignmentMorph newRow
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		cellInset: 5@15;
		layoutInset: (0 @ 8 corner: 0 @ 8).

	allSpritesRadioButton := ToggleButton
		onForm: (ScratchFrameMorph skinAt: #radioButtonOn)
		offForm: (ScratchFrameMorph skinAt: #radioButton).
	allSpritesRadioButton
		on;
		target: self;
		actionSelector: #toggleSpriteSpecific.
	label1 := StringMorph new
		contents: ('For all sprites' localized);
		font: (ScratchFrameMorph getFont: #NewVariableDialogBox);
		lock.
	radioButtons addMorphBack: allSpritesRadioButton.
	radioButtons addMorphBack: label1.
	
	"add an extra bit of spce; must be a better way"
	radioButtons addMorphBack: (Morph new extent: (5@5); color: Color transparent).

	thisSpriteRadioButton := allSpritesRadioButton fullCopy off.
	label2 := StringMorph new
		contents: ('For this sprite only' localized);
		font: (ScratchFrameMorph getFont: #NewVariableDialogBox);
		lock.
	radioButtons addMorphBack: thisSpriteRadioButton.
	radioButtons addMorphBack: label2.

	ScratchTranslator isRTL
		ifTrue: [radioButtons submorphs reversed do: [:m |
			m delete.
			radioButtons addMorphBack: m]].

	mainColumn submorphsDo: [: m |
		((m = messageLineMorphs) not) ifTrue: [m delete]].
	mainColumn
		vResizing: #shrinkWrap;
		cellInset: 0@5;
		addMorphBack: responseArea;
		addMorphBack: radioButtons;
		addMorphBack: buttonRow
! !
