
!ScratchCategorySelector methodsFor: 'initialization' stamp: 'EMP 7/13/2017 14:52'!
initialize
	super initialize.
	self extent: 100@20.
	categoryColor := Color r: 255 g: 0 b: 0.
	textColor := Color r: 0.5 g: 0.5 b: 0.5.
	label := translatedLabel := ''.
	isSelected := false.
	self changed.! !