
!ScratchCommentMorph methodsFor: 'private' stamp: 'EMP 11/5/2017 20:52'!
tupleSequence
	"Answer an array with a single tuple describing this comment."

	"anchor isNil
		ifTrue: [
			^ Array
				with: #scratchComment
				with: commentMorph contents
				with: isShowing
				with: self width
				with: -1]
		ifFalse: [
			^ Array
				with: #scratchComment
				with: commentMorph contents
				with: isShowing
				with: self width
				with: anchor blockID]"
	^ {
		self width.
		commentMorph height + 12.
		isShowing.
		anchor ifNil: [-1] ifNotNil: [anchor blockID].
		commentMorph contents.
	}! !
