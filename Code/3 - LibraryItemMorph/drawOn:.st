
!LibraryItemMorph methodsFor: 'drawing' stamp: 'EMP 7/14/2017 09:10'!
drawOn: aCanvas
	"Draw my selected or rollover state if necessary."
	| fillColor outlineColor |
	fillColor := isSelected ifTrue: [Color r: 208 g: 208 b: 208 range: 255] ifFalse: [target isScratchStageMorph ifTrue: [Color transparent] ifFalse:  [Color white]].
	outlineColor := isSelected ifTrue: [Color r: 23 g: 159 b: 215 range: 255] ifFalse: [target isScratchStageMorph ifTrue: [Color transparent] ifFalse:  [Color white]].
	aCanvas frameAndFillRoundRect: bounds radius: 12 fillStyle: fillColor borderWidth: 3 borderColor: outlineColor.! !