
!PositionableStream methodsFor: '*SVG-Morphic' stamp: 'gvc 10/3/2005 10:14'!
upToAny: aCollection 
	"Answer a subcollection from the current access position to the 
	occurrence (if any, but not inclusive) of any objects in the given coellection in the receiver. If 
	any of these is not in the collection, answer the entire rest of the receiver."
	| newStream element |
	newStream := WriteStream on: (collection species new: 100).
	[self atEnd or: [aCollection includes: (element := self next)]]
		whileFalse: [newStream nextPut: element].
	(aCollection includes: element)
		ifTrue: [self skip: -1].
	^newStream contents! !
