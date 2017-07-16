
!ScratchTabMorph methodsFor: 'drawing' stamp: 'EMP 7/14/2017 16:24'!
drawOn: aCanvas
	| style textColor |
	selected ifTrue: [
		style := SelectedStyle.
		textColor := Color r: 92 g: 93 b: 95 range: 255.
	] ifFalse: [
		style := NormalStyle.
		textColor := Color r: 143 g: 145 b: 147 range: 255.
	].
	style origin: self topLeft.
	style direction: 0@(bounds height + 8).
	aCanvas clipBy: bounds during: [:canv |
	aCanvas frameAndFillRoundRect: (bounds extendBy: 0@8) radius: self cornerRadius fillStyle: style borderWidth: 1 borderColor:  ScratchFrameMorph borderColor.
		].
	aCanvas drawString: translatedLabel in: ((self topLeft + (10@8)) extent: self bottomRight) font: (ScratchFrameMorph getFont: #Tab) color: textColor! !
