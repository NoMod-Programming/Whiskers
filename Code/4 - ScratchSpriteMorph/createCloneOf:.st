
!ScratchSpriteMorph methodsFor: 'clone ops' stamp: 'EMP 7/18/2017 15:43'!
createCloneOf: anObject
	"Clone this sprite and send the clone (and only the clone) the given message."
	| frame clone |
	(frame _ self ownerScratchFrame) ifNil: [(frame _ ((self ownerThatIsA: OffscreenWorldMorph) frame)) ifNil: [^ self]].
	anObject ifNil: [^ self].
	frame workPane cloneCount > 300 ifTrue: [^ self].
	anObject = #'_myself_' ifTrue: [clone _ self fullCopy] ifFalse: [
	clone _ anObject fullCopy].
	clone objName: objName, ' clone'.
	clone isClone: true.
	clone blocksBin allMorphsDo: [:m |
		(m isKindOf: BlockMorph) ifTrue: [m stopProcess]].
	frame workPane addMorph: clone.
	frame workPane addClone.
	clone eventReceived: (ScratchClonedEvent new).! !
