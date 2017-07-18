
!String methodsFor: '*JSON-writing' stamp: 'ul 11/9/2010 04:07'!
jsonWriteOn: aStream

	aStream nextPut: $".
	self do: [ :ch |
		(Json escapeForCharacter: ch)
			ifNil: [ aStream nextPut: ch ]
			ifNotNil: [ :replacement |
				aStream nextPutAll: replacement ] ].
	aStream nextPut: $".
! !
