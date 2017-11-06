
!ScratchSpriteMorph methodsFor: 'sensing ops' stamp: 'EMP 11/5/2017 18:03'!
getAttribute: attr
	"Answer the value of my variable or built-in attribute with the given name. Answer zero if I have no attribute or variable with the given name."

	| a |
	(vars includesKey: attr) ifTrue: [^ (vars at: attr) varValue].

	a := attr localized.
	'x position' localized = a ifTrue: [^ self xpos].
	'y position' localized = a ifTrue: [^ self ypos].
	'direction' localized = a ifTrue: [^ self heading].
	'costume #' localized = a ifTrue: [^ self costumeIndex].
	'size' localized = a ifTrue: [^ self scale].
	'volume' localized = a ifTrue: [^ self volume].
	^ 0
! !
