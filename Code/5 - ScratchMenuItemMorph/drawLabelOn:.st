
!ScratchMenuItemMorph methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 14:26'!
drawLabelOn: aCanvas 

	| stringBounds |	
	stringBounds := bounds.
	stringBounds := stringBounds left: stringBounds left + self leftMargin.
	
	self hasIcon ifTrue: [
		stringBounds := stringBounds left: stringBounds left + self iconForm width + 2 ].
	self hasMarker ifTrue: [
		stringBounds := stringBounds left: stringBounds left + self submorphBounds width + 8 ].
	
	stringBounds := stringBounds top: stringBounds top + stringBounds bottom - self fontToUse height // 2.

	aCanvas
		drawString: contents
		in: stringBounds
		font: self fontToUse
		color: self colorToUse.! !
