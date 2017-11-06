
!ScratchVariableDictionary methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 18:04'!
jsonWriteOn: aStream

	| needComma |
	needComma := false.
	aStream nextPut: ${.
	self associationsDo: [ :assoc |
		needComma
			ifTrue: [ aStream nextPut: $, ]
			ifFalse: [ needComma := true ].
		assoc varName jsonWriteOn: aStream.
		aStream nextPut: $:.
		assoc varValue jsonWriteOn: aStream ].
	aStream nextPut: $}.! !
