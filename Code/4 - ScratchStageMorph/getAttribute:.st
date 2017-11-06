
!ScratchStageMorph methodsFor: 'sensing ops' stamp: 'EMP 11/5/2017 18:03'!
getAttribute: attr
	"Answer the value of my variable or built-in attribute with the given name. Answer zero if I have no attribute or variable with the given name."

	| a |
	(vars includesKey: attr) ifTrue: [^ (vars at: attr) varValue].

	a := attr localized.
	'background #' localized = a ifTrue: [^ self backgroundIndex].
	'volume' localized = a ifTrue: [^ self volume].
	^ 0
! !
