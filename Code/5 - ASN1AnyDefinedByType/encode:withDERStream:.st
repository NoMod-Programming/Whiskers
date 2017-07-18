
!ASN1AnyDefinedByType methodsFor: 'encoding' stamp: 'rww 3/27/2007 16:15'!
encode: obj withDERStream: derStream

	self error: 'must encode in the scope of a structured container'.
! !
