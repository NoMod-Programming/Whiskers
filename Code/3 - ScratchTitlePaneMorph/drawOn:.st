
!ScratchTitlePaneMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/14/2017 13:46'!
drawOn: aCanvas
	Style origin: bounds topLeft.
	Style direction: 0@(bounds height).
	aCanvas frameAndFillRoundRect: (bounds extendBy: 0@8) radius: self cornerRadius fillStyle: Style borderWidth: 1 borderColor: ScratchFrameMorph borderColor.
	aCanvas line: bounds bottomLeft to: bounds bottomRight width: 1 color: ScratchFrameMorph borderColor! !