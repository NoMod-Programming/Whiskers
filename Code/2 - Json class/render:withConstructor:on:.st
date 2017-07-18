
!Json class methodsFor: 'as yet unclassified' stamp: 'tonyg 11/30/2005 16:32'!
render: anObject withConstructor: aConstructorName on: aStream
	aStream nextPutAll: '@', aConstructorName.
	anObject jsonWriteOn: aStream.
! !
