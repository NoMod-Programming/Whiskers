

!DSAPublicKey methodsFor: 'converting' stamp: 'rww 10/16/2016 19:26'!

subjectPublicKey



	^ ASN1BitString fromByteArray: y asAsn1DerBytes! !

