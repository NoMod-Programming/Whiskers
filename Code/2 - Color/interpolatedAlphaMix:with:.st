
!Color methodsFor: '*SVG-Morphic' stamp: 'gvc 8/2/2005 10:51'!
interpolatedAlphaMix: ratio with: aColor
	"Answer a proper interpolated color between the receiver and aColor.
	Ratio is 0.0..1.0."

	|alpha|
	alpha := ratio * (aColor alpha - self alpha) + self alpha.
	^Color
		r:  ratio * aColor red * alpha + (1.0 - ratio * self red * alpha)
		g: ratio * aColor green * alpha + (1.0 - ratio * self green * alpha)
		b: ratio * aColor blue * alpha + (1.0 - ratio * self blue * alpha)
		alpha: alpha! !
