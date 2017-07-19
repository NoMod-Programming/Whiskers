

!DSAPublicKey methodsFor: 'converting' stamp: 'rww 12/3/2016 21:58'!

asAsn1DerBytes



	| algorithm keyInfo |

	algorithm := OrderedCollection 

		with: (ASN1ObjectId fromString: '1.2.840.10040.4.1') 

		with: self dssSig.

	keyInfo := OrderedCollection with: algorithm with: self subjectPublicKey.

	^ keyInfo asAsn1DerBytes.

! !

