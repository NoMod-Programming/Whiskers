
!ScratchLibraryMorph methodsFor: 'initialization' stamp: 'EMP 11/4/2017 22:15'!
makeNewSpriteButtons: aScratchFrameMorph
	"Return a morph containing a set of new sprite buttons."

	| panel buttonSpecs buttons button butonExtent x label |
	panel := Morph new color: Color transparent.

	buttonSpecs := #(
		"	icon name				selector					tooltip"
		(newSpriteSurprise 		surpriseSpriteMorph	'Get surprise sprite')
		(newSpritePaint			paintSpriteMorph		'Paint new sprite')
		(newSpriteLibrary			addSpriteMorph		'Choose new sprite from file')
	).

	buttons := buttonSpecs collect: [:spec |
		button := ToggleButton new
			onForm: (ScratchFrameMorph skinAt: (spec at: 1))
			offForm: (ScratchFrameMorph skinAt: (spec at: 1)) .

		button
			target: aScratchFrameMorph;
			actionSelector: (spec at: 2);
			setBalloonText:  (spec at: 3) localized maxLineLength: 100.
		button].

	butonExtent := ScratchFrameMorph isXO ifTrue: [37@27] ifFalse: [30@20].
	label := ((StringMorph contents: 'New Sprite:' font: (ScratchFrameMorph getFont: #Tab)) color: (ScratchFrameMorph textColor); yourself).
	panel addMorph: (label position: 0@6).

	x := label width + 5.
	buttons do: [:b |
		b extent: butonExtent.
		panel addMorph: (b position: x@1).
		x := x + b width - 7].

	panel extent: x@(butonExtent y + 1).

	^ panel
! !
