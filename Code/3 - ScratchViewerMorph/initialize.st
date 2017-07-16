
!ScratchViewerMorph methodsFor: 'initialization' stamp: 'EMP 7/15/2017 15:47'!
initialize

	super initialize.
	categoryButtons := #().
	topSectionHeight := 120.
	color := ScratchFrameMorph palettePaneColor.
	pageViewer := ScrollFrameMorph2 new growthFraction: 0.1; showHorizontalScrollbar: false.
	self addMorphBack: (pageViewer position: self position + (0@120)).
	self target: nil.
	self extent: 214@500.
	self buildCategorySelectors! !
