
!LibraryItemMorph methodsFor: 'drawing' stamp: 'EMP 11/4/2017 22:24'!
drawOn: aCanvas
	"Draw my selected or rollover state if necessary."
	| fillColor outlineColor |
	fillColor := isSelected ifTrue: [
		ScratchFrameMorph itemSelectedColor
	] ifFalse: [
		target isScratchStageMorph ifTrue: [
			Color transparent
		] ifFalse:  [
			Color white
		]
	].
	outlineColor := isSelected ifTrue: [
		ScratchFrameMorph overColor
	] ifFalse: [
		target isScratchStageMorph ifTrue: [
			Color transparent
		] ifFalse:  [
			Color white
		]
	].
	aCanvas frameAndFillRoundRect: bounds radius: 12 fillStyle: fillColor borderWidth: 3 borderColor: outlineColor.! !
