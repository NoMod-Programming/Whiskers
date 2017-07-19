
!ScratchViewerMorph methodsFor: 'initialization' stamp: 'EMP 7/18/2017 16:32'!
buildCategorySelectors

	| maxExtent b pad leftColumnX rightColumnX x y label |
	"First, delete the old category buttons"
	categoryButtons do: [:m | m delete].

	"Create new buttons, keeping track of the maximum extent."
	maxExtent := 100@20.
	categoryButtons := (CatList select: [:cat | cat fifth]) collect: [:cat |
		label := cat first.
		b := ScratchCategorySelector new.
		b color: color.
		b label: label.
		b categoryColor: (Color r: cat second g: cat third b: cat fourth range: 255).
		b].

	"calculate catButtonsExtent"
	pad := 5. "padding on left, right, and betwen the button columns"
	catButtonsExtent := (2 * maxExtent x) @ (((categoryButtons size // 2) * (maxExtent y + 2 + 5))).

	"place the buttons"
	leftColumnX := self left + (pad * 2).
	rightColumnX := leftColumnX + maxExtent x + pad.
	x := leftColumnX.
	y := self top + 10.
	1 to: categoryButtons size do: [:i |
		b := categoryButtons at: i.
		b extent: maxExtent.
		self addMorph: (b position: x@y).
		i even
			ifTrue: [x := leftColumnX. y := y + b height + 3]
			ifFalse: [x := rightColumnX]].

	self width: catButtonsExtent x.
	pageViewer position: self position + (0@catButtonsExtent y).
	topSectionHeight := catButtonsExtent y - 4.
! !
