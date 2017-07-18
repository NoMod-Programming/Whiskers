
!DSAPrivateKey methodsFor: 'converting' stamp: 'rww 10/16/2016 19:27'!
asAsn1DerBytes

	| algorithm keyInfo |
	algorithm := OrderedCollection 
		with: (ASN1ObjectId fromString: '1.2.840.10040.4.1') 
		with: self dssSig.
	keyInfo := OrderedCollection with: algorithm with: self subjectPrivateKey.
	^ keyInfo asAsn1DerBytes.
! !
