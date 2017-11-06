
!ScratchCommentMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 16:34'!
width: aNumber

	super width: (self minimumWidth max: aNumber).
	commentMorph notNil & resizeMorph notNil ifTrue: [
		commentMorph width: self width - resizeMorph width].
! !
