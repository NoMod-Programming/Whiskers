
!GradientFillStyle methodsFor: '*SVG-Morphic' stamp: 'gvc 7/29/2005 20:47'!
alphaMixed: fraction
	"Answer a new fill with the extra transparency."

	^self copy colorRamp: (colorRamp collect:[:assoc| assoc key -> (assoc value alphaMixed: fraction)])! !
