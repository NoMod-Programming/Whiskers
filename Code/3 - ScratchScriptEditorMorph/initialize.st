
!ScratchScriptEditorMorph methodsFor: 'initialization' stamp: 'EMP 7/15/2017 15:42'!
initialize

	super initialize.
	color := Color white.
	topSectionHeight := 28 + 5.

	thumbnailMorph := ScratchThumbnailMorph new.
	self addMorph: (thumbnailMorph position: self position + (37@16)).

	pageViewerMorph := ScrollFrameMorph2 new
		growthFraction: 0.1;
		color: ScratchFrameMorph scriptsPaneColor.
	self addMorph: (pageViewerMorph position: (self left @ self top)).

	self target: nil.
	thumbnailMorph extent: 50@80.
	self createTabPane.
	self extent: 300@400.
! !