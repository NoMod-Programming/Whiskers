
!VariableArgMorph methodsFor: 'event handling' stamp: 'EMP 11/5/2017 18:16'!
setArgFromMenuChoice: choice
	"The user selected a Scratch object or the special value #mouse or #edge."

	morph := choice.
	self fixGetAttribueBlock.
	self updateLabel.
! !
