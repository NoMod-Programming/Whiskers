
!BooleanArgMorph class methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 12:13'!
drawEndFormsForHeight: height
	"draw my end forms to suit height"
	| baseColor darkerC lighterC right topY bottomY xInset c aCanvas |
	"colors are chosen to give values 0/1/2/3 in a 2bpp Form; a clor map is used to display in my 'real' colors"
	baseColor := Color black.
	lighterC := Color white.
	darkerC := Color gray.
	right := 3 * height.
	aCanvas := FormCanvas extent: right@height depth: 2.
	topY := bottomY := height // 2.
	height even ifTrue: [topY := bottomY - 1].
	xInset := 0.
	[topY >= 0] whileTrue: [
		self drawHLineFrom: xInset to: (xInset + 2) y: topY color: darkerC on: aCanvas.
		c := (topY <= 1) ifTrue: [darkerC] ifFalse: [baseColor].
		self drawHLineFrom: xInset + 2 to: right - (xInset + 1) y: topY color: c on: aCanvas.
		self drawHLineFrom: (right - (xInset + 1)) to: (right - xInset) y: topY color: darkerC on: aCanvas.

		self drawHLineFrom: xInset to: (xInset + 1) y: bottomY color: lighterC on: aCanvas.
		c := (bottomY >= (height - 2)) ifTrue: [lighterC] ifFalse: [baseColor].
		self drawHLineFrom: xInset + 1 to: right - (xInset + 1) y: bottomY color: c on: aCanvas.
		self drawHLineFrom: (right - (xInset + 2)) to: (right - xInset) y: bottomY color: lighterC on: aCanvas.

		xInset := xInset + 1.	
		bottomY := bottomY + 1.
		topY := topY - 1].
	^aCanvas form
! !
