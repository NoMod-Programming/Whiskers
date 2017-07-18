
!PositionableStream methodsFor: '*SVG-Morphic' stamp: 'gvc 7/29/2005 00:14'!
nextNumber
	"Answer a number from the stream."

	|element|
	[(element := self next) isNil or: [element isDigit or: [element = $-]]] whileFalse.
	element ifNil: [^nil].
	self skip: -1.
	^Number readFrom: self! !
