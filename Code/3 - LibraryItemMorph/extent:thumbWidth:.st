
!LibraryItemMorph methodsFor: 'initialization' stamp: 'EMP 7/14/2017 09:09'!
extent: aRectangle thumbWidth: w

	lastUpdateMSecs := -1.
	self extent: aRectangle.
	thumbWidth := w.

	self buildSubmorphs.
	self target: nil.
	isSelected := nil.
	rolloverOn := false.
	currentForm := nil.
	self highlight: false.
! !