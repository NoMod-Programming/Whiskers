
!Association methodsFor: '*JSON-writing' stamp: 'matthias.berth 11/19/2009 10:21'!
jsonWriteOn: aStream
	self key asString jsonWriteOn: aStream.
	aStream nextPut: $:; space.
	self value jsonWriteOn: aStream.! !
