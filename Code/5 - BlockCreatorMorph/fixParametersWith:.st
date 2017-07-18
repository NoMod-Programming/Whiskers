
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 12:07'!
fixParametersWith: anOrderedCollectionOfValues
	| args i |
	args _ self submorphs select: [:m | m isKindOf: ColoredExpressionArgMorph].
	i _ 0.
	args do: [:arg | i _ i + 1. arg stringExpression: (anOrderedCollectionOfValues at: i ifAbsent: [self defaultNameForArgMorph: arg])].! !
