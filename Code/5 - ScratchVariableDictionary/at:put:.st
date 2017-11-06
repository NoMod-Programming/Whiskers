
!ScratchVariableDictionary methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 17:58'!
at: key put: anObject 
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject."

	| index |
	index := self scanFor: key.
	(array at: index)
		ifNil: [ self atNewIndex: index put: (ScratchVariable new varName: key; varValue: anObject) ]
		ifNotNil: [ :association | association varValue: anObject ].
	^anObject! !
