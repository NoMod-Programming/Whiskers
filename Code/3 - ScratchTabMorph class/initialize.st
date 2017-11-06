
!ScratchTabMorph class methodsFor: 'as yet unclassified' stamp: 'EMP 11/4/2017 22:19'!
initialize
	SelectedStyle := GradientFillStyle ramp: {
		0.0 -> Color white.
		0.77 -> ScratchFrameMorph palettePaneColor. "Eh good enough"
	}.
	NormalStyle := GradientFillStyle ramp: {
		0.66 -> ScratchFrameMorph panelColor.
		0.77 -> ScratchFrameMorph palettePaneColor. "Eh good enough"
	}! !
