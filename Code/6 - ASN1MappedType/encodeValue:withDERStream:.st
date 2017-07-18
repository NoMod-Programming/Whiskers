
!ASN1MappedType methodsFor: 'encoding' stamp: 'rww 3/27/2007 15:29'!
encodeValue: anObject withDERStream: derStream

	self elements do: [:each |
		each encode: anObject withDERStream: derStream].
! !
