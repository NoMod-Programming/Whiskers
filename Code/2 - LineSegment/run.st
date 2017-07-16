
!LineSegment methodsFor: '*SVG-Morphic' stamp: 'gvc 10/25/2005 12:40'!
run
	"Answer the run for the receiver."

	^self runClass segments: (OrderedCollection with: self)! !
