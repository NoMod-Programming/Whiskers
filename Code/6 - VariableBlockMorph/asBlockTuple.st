
!VariableBlockMorph methodsFor: 'private' stamp: 'EMP 11/5/2017 18:41'!
asBlockTuple
	"Answer a tuple (Array) describing this block and its arguments."

	^ Array with: #readVariable with: varReference varName! !
