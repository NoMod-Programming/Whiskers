
!ScratchCategorySelector methodsFor: 'initialization' stamp: 'EMP 11/4/2017 22:26'!
initialize
	super initialize.
	self extent: 100@20.
	categoryColor := Color r: 255 g: 0 b: 0 range: 255.
	textColor := Color r: 127 g: 127 b: 127 range: 255.
	label := translatedLabel := ''.
	isSelected := false.
	self changed.! !
