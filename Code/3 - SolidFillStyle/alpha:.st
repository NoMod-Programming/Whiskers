
!SolidFillStyle methodsFor: '*SVG-Morphic' stamp: 'gvc 7/29/2005 19:48'!
alpha: fraction
	"Answer a new fill with the extra transparency."

	^self copy 
		color: (self color alphaMixed: fraction)! !
