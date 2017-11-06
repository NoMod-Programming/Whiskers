
!ScratchPresenterMorph class methodsFor: 'as yet unclassified' stamp: 'EMP 11/4/2017 22:16'!
initialize
	TopStyle := GradientFillStyle ramp: {
		0.0 -> Color white.
		0.9 -> ScratchFrameMorph palettePaneColor. "Eh good enough"
	}! !
