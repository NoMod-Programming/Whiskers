
!LibraryItemMorph methodsFor: 'initialization' stamp: 'EMP 11/3/2017 20:40'!
extent: aRectangle thumbWidth: w

	lastUpdateMSecs := -1.
	self extent: aRectangle.
	thumbWidth := w.

	self buildSubmorphs.
	self target: nil.
	isSelected := nil.
	rolloverOn := false.
	self highlight: false.
! !
