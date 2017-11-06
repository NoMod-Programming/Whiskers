
!VariableArgMorph methodsFor: 'other' stamp: 'EMP 11/5/2017 18:16'!
fixArgLayout
	"Set my color to my owner's color."

	self color: (owner color mixed: 0.7 with: (Color gray: 0.3)).
! !
