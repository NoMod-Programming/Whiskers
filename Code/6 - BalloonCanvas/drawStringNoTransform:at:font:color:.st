
!BalloonCanvas methodsFor: '*SVG-Morphic' stamp: 'gvc 7/30/2005 10:52'!
drawStringNoTransform: s at: aPoint font: fontOrNil color: c
	"Draw a string. Don't care about the transform."

	^super drawString: s from: 1 to: s size at: aPoint font: fontOrNil color: c! !
