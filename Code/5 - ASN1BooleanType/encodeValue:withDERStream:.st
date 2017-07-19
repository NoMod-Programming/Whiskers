

!ASN1BooleanType methodsFor: 'encoding' stamp: 'rww 3/25/2007 12:04'!

encodeValue: anObject withDERStream: derStream



	anObject 

		ifTrue: [derStream nextPut: 255]

		ifFalse: [derStream nextPut: 0].

! !

