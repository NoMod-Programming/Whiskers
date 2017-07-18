
!Bezier2Segment methodsFor: '*SVG-Morphic' stamp: 'gvc 7/30/2005 19:27'!
boundingBox
	"Return the bounds containing the receiver"
	^super bounds encompass: (self valueAt: 0.5)! !
