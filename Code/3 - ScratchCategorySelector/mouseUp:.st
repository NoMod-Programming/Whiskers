
!ScratchCategorySelector methodsFor: 'event handling' stamp: 'EMP 7/13/2017 16:07'!
mouseUp: evt
	(bounds containsPoint: evt cursorPoint) ifTrue: [
		isSelected := isSelected not.
		textColor := isSelected ifTrue: [Color white] ifFalse: [Color gray].
		owner currentCategory: label.
		self changed
	]! !