
!ScriptableScratchMorph methodsFor: 'sensing ops' stamp: 'EMP 11/5/2017 18:07'!
getAttribute: attr
	"Answer the value of my variable or built-in attribute with the given name. Answer zero if I have no attribute or variable with the given name."

	(vars includesKey: attr) ifTrue: [^ (vars at: attr) varValue].
	^ 0
! !
