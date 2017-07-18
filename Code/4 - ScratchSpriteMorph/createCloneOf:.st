
!ScratchSpriteMorph methodsFor: 'clone ops' stamp: 'EMP 7/17/2017 17:05'!
createCloneOf: anObject
	"Clone this sprite and send the clone (and only the clone) the given message."
	| frame clone |
	(frame _ self ownerThatIsA: ScratchFrameMorph) ifNil: [(frame _ ((self ownerThatIsA: OffscreenWorldMorph) frame)) ifNil: [^ self]].
	anObject ifNil: [^ self].
	anObject = #'_myself_' ifTrue: [clone _ self fullCopy] ifFalse: [
	clone _ anObject fullCopy].
	clone objName: objName, ' clone'.
	clone isClone: true.
	clone blocksBin allMorphsDo: [:m |
		(m isKindOf: BlockMorph) ifTrue: [m stopProcess]].
	frame workPane addMorph: clone.
	clone eventReceived: (ScratchClonedEvent new).! !
