
!Point methodsFor: '*SVG-Morphic' stamp: 'gvc 10/3/2005 15:24'!
angle
	"Answer the angle in radians between the vectors represented by
	the receiver and (1, 0) from the origin."

	^self y arcTan: self x! !
