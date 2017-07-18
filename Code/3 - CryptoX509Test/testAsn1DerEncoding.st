
!CryptoX509Test methodsFor: 'as yet unclassified' stamp: 'rww 10/16/2016 19:37'!
testAsn1DerEncoding

	self assert: self certificate1 asAsn1DerBytes = self certificate1Asn1DerBytes.
	self assert: self certificate2 asAsn1DerBytes = self certificate2Asn1DerBytes.
	self assert: self certificate3 asAsn1DerBytes = self certificate3Asn1DerBytes.
	self assert: self certificate4 asAsn1DerBytes = self certificate4Asn1DerBytes.
! !
