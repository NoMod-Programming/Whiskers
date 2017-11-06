
!ScratchTabMorph methodsFor: 'drawing' stamp: 'EMP 11/4/2017 22:17'!
drawOn: aCanvas
	| style textColor |
	selected ifTrue: [
		style := SelectedStyle.
		textColor := ScratchFrameMorph textColor.
	] ifFalse: [
		style := NormalStyle.
		textColor := ScratchFrameMorph offColor.
	].
	style origin: self topLeft.
	style direction: 0@(bounds height + 8).
	aCanvas clipBy: bounds during: [:canv |
	aCanvas frameAndFillRoundRect: (bounds extendBy: 0@8) radius: self cornerRadius fillStyle: style borderWidth: 1 borderColor:  ScratchFrameMorph borderColor.
		].
	aCanvas drawString: translatedLabel in: ((self topLeft + (10@8)) extent: self bottomRight) font: (ScratchFrameMorph getFont: #Tab) color: textColor! !
