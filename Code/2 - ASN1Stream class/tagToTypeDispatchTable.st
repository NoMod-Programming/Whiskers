

!ASN1Stream class methodsFor: 'class initialization' stamp: 'rww 3/22/2007 14:25'!

tagToTypeDispatchTable



	TagToTypeDispatchTable isNil ifTrue: [self initializeTagToTypeDispatchTable].

	^ TagToTypeDispatchTable

! !

