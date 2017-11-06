
!ScratchCommentMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 16:37'!
height: aNumber

	super height: (self minimumHeight max: aNumber).
	commentMorph notNil & resizeMorph notNil ifTrue: [
		commentMorph height: self height - resizeMorph height].
! !
