
!ScratchFrameMorph methodsFor: 'intialization' stamp: 'EMP 7/13/2017 22:13'!
addShortcutButtonsTo: rowMorph

	| buttonSpecs b |
	buttonSpecs := #(
		"name		tool tip				selector"
		(language	'Set language'		languageMenu:)
	).
	AllowSharing ifFalse: [
		buttonSpecs := buttonSpecs select: [:spec | spec first ~= #share]].

	buttonSpecs do: [:spec |
		b := ToggleButton
			onForm: (ScratchFrameMorph skinAt: (spec at: 1), 'ButtonOver')
			offForm: (ScratchFrameMorph skinAt: (spec at: 1), 'Button')
			overForm: (ScratchFrameMorph skinAt: (spec at: 1), 'ButtonOver').
		b
			target: self;
			actionSelector: (spec at: 3);
			setBalloonText: (spec at: 2) localized maxLineLength: 100;
			actWhen: #buttonUp;
			isMomentary: true.
		
		('language' = (spec at: 1)) ifTrue: [  "language special case"
			b arguments: (Array with: b)].

		('save' = (spec at: 1)) ifTrue: [  "bigger spacer"
			rowMorph addMorphBack: (Morph new extent: (10@5); color: Color transparent)].

		('share' = (spec at: 1)) ifTrue: [  "add spacer between buttons"
			rowMorph addMorphBack: (Morph new extent: (8@5); color: Color transparent)].
		rowMorph addMorphBack: b].

	rowMorph addMorphBack: (Morph new extent: (15@5); color: Color transparent).
! !
