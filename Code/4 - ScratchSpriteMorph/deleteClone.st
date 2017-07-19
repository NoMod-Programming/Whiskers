
!ScratchSpriteMorph methodsFor: 'clone ops' stamp: 'EMP 7/18/2017 15:44'!
deleteClone
	| frame |
	isClone ifTrue: [self delete] ifFalse: [^ self].
	(frame _ self ownerScratchFrame) ifNil: [(frame _ ((self ownerThatIsA: OffscreenWorldMorph) frame)) ifNil: [^ self]].
	frame workPane deleteClone! !
