
!ScratchCategorySelector methodsFor: 'event handling' stamp: 'EMP 7/16/2017 21:25'!
mouseUp: evt
	(bounds containsPoint: evt cursorPoint) ifTrue: [
		isSelected := true.
		textColor := isSelected ifTrue: [Color white] ifFalse: [Color gray].
		owner currentCategory: label.
		self changed
	]! !
