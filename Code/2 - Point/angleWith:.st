
!Point methodsFor: '*SVG-Morphic' stamp: 'gvc 10/3/2005 14:13'!
angleWith: aPoint
	"Answer the angle in radians between the vectors represented by
	the receiver and aPoint from the origin."

	|ar ap|
	ar _ self angle.
	ap _ aPoint angle.
	^ap >= ar
		ifTrue: [ap - ar]
		ifFalse: [Float pi * 2 - ar + ap]! !
