
!ASN1PragmaAccessor methodsFor: 'printing' stamp: 'RJT 9/2/2006 15:23'!
printOn: aWS
	aWS nextPutAll: self asn1name asString, String tab, self systemClass asString, '>>', self method asString.! !
