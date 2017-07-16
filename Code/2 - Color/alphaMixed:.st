
!Color methodsFor: '*SVG-Morphic' stamp: 'gvc 7/29/2005 19:38'!
alphaMixed: proportion
	"Answer this color with the alpha modified by proportion."

	^ Color
		r: self red 
		g: self green
		b: self blue
		alpha: self alpha * proportion! !
