
!DSAPrivateKey methodsFor: 'converting' stamp: 'rww 10/16/2016 19:25'!
subjectPrivateKey

	^ ASN1BitString fromByteArray: x asAsn1DerBytes! !
