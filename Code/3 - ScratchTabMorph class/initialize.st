
!ScratchTabMorph class methodsFor: 'as yet unclassified' stamp: 'EMP 7/14/2017 16:31'!
initialize
	SelectedStyle := GradientFillStyle ramp: {
		0.0 -> Color white.
		0.77 -> (Color r: 230 g: 232 b: 232 range: 255). "Eh good enough"
	}.
	NormalStyle := GradientFillStyle ramp: {
		0.66 -> (Color r: 242 g: 242 b: 242 range: 255).
		0.77 -> (Color r: 230 g: 232 b: 232	 range: 255). "Eh good enough"
	}! !