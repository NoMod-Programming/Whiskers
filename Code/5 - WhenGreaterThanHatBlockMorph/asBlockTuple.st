
!WhenGreaterThanHatBlockMorph methodsFor: 'other' stamp: 'EMP 7/16/2017 20:21'!
asBlockTuple
	"Answer a tuple (Array) describing this block and its arguments."

	| argTuple secondArgTuple |
	argTuple _ (argMorph isKindOf: ArgMorph)
		ifTrue: [argMorph evaluate]
		ifFalse: [argMorph asBlockTuple].
	secondArgTuple _ (secondArgMorph isKindOf: ArgMorph)
		ifTrue: [secondArgMorph evaluate]
		ifFalse: [secondArgMorph asBlockTuple].

	^ Array with: #whenSensorGreaterThan with: secondArgTuple with: argTuple! !
