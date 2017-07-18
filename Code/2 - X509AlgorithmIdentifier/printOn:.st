
!X509AlgorithmIdentifier methodsFor: 'printing' stamp: 'rww 4/28/2007 11:41'!
printOn: stream

	super printOn: stream.
	stream nextPutAll: '('.
	stream nextPutAll: self oid asString.
	stream nextPutAll: ')'.
! !
