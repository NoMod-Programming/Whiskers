
!ScratchCategorySelector methodsFor: 'accessing' stamp: 'EMP 7/13/2017 16:09'!
isSelected: anObject

	anObject ~= isSelected ifTrue: [
		isSelected := anObject.
		textColor := isSelected ifTrue: [Color white] ifFalse: [Color gray].
		self changed
	]! !
