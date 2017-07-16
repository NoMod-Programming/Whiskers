
!ScratchCategorySelector methodsFor: 'event handling' stamp: 'EMP 7/13/2017 15:21'!
mouseEnter: evt
	isSelected ifFalse: [
		textColor := Color r: 251 g: 169 b: 57 range: 255.
		self changed.
	]! !
