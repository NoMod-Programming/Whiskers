
!VariableArgMorph methodsFor: 'other' stamp: 'EMP 11/5/2017 18:33'!
evaluate
	"Answer either nil, the symbol #mouse, or a Scratch sprite object."

	morph ifNil: [^ ''].
	^ morph varName
! !
