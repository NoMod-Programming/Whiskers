
!EuclidAlgorithm methodsFor: 'as yet unclassified' stamp: 'dik 9/28/2010 14:01'!
run
	((a isKindOf: LargePositiveInteger)
		and: [b isKindOf: LargePositiveInteger])
		ifTrue: [self lehmer]
		ifFalse: [self doBasicAlgorithm]! !
