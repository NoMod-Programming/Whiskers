
!Dictionary methodsFor: '*JSON-writing' stamp: 'Igor.Stasenko 12/27/2009 08:10'!
jsonWriteOn: aStream

	| needComma |
	needComma := false.
	aStream nextPut: ${.
	self associationsDo: [ :assoc |
		needComma
			ifTrue: [ aStream nextPut: $, ]
			ifFalse: [ needComma := true ].
		assoc key jsonWriteOn: aStream.
		aStream nextPut: $:.
		assoc value jsonWriteOn: aStream ].
	aStream nextPut: $}.! !
