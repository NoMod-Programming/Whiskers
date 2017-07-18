
!HashFunction class methodsFor: 'hashing' stamp: 'rww 10/16/2016 19:26'!
digestInfoAsn1DerEncodingFromMessage: msg

	^ (self digestInfoFromMessage: msg) asAsn1DerBytes! !
