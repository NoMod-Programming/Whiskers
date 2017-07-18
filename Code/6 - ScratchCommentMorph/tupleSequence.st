
!ScratchCommentMorph methodsFor: 'private' stamp: 'EMP 7/17/2017 19:30'!
tupleSequence
	"Answer an array with a single tuple describing this comment."

	anchor isNil
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
				with: anchor blockID]
! !
