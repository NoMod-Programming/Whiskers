
!ASN1WrapperConstructedType methodsFor: 'encoding' stamp: 'rww 3/25/2007 20:21'!
encodeValue: anObject withDERStream: derStream

	anObject tagValue do: [:each |
		derStream encode: each].
	
! !
