
!VariableBlockMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 19:25'!
fullCopy
	"Overridden to allow keeping the variable reference, in case of renaming"
	^ super fullCopy variable: (self variable)! !
