
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 09:57'!
labelMorphFor: aString

	| s |
	s _ ((((aString copyReplaceAll: '\\@' with: '@') copyReplaceAll: '\\%' with: '%') copyReplaceAll: '\/' with: '/') copyReplaceAll: '\\\\' with: '\').
	^ (CustomBlockLabelMorph new stringExpression: s)! !
