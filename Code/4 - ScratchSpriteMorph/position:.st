
!ScratchSpriteMorph methodsFor: 'accessing' stamp: 'EMP 7/18/2017 13:01'!
position: aPoint
	"Change the position of this morph and and all of its submorphs. This is a slightly modified copy of the Morph version that allows for floating point co-ordinates that arise when sprites are moved by 0.5 etc. This might cause problems in displaying later?"
	| delta box |
	delta := aPoint asNonFractionalPoint - bounds topLeft.
	(delta x = 0
			and: [delta y = 0])
		ifTrue: [^ self].
	"Null change"
	box := self fullBounds.
	(delta dotProduct: delta)
			> 100
		ifTrue: ["e.g., more than 10 pixels moved"
			self invalidRect: box.
			self
				invalidRect: (box translateBy: delta)]
		ifFalse: [self
				invalidRect: (box
						merge: (box translateBy: delta))].
	self privateFullMoveBy: delta.
	owner
		ifNotNil: [owner layoutChanged]! !
