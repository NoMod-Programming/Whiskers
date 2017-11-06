
!ScratchVariableDictionary methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 17:56'!
add: anAssociation

	| index |
	index := self scanFor: anAssociation varName.
	(array at: index)
		ifNil: [ self atNewIndex: index put: anAssociation ]
		ifNotNil: [ :element |	element varValue: anAssociation varValue ].
	^anAssociation! !
