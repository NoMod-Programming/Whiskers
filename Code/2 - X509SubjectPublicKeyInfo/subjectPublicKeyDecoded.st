

!X509SubjectPublicKeyInfo methodsFor: 'accessing' stamp: 'rww 3/28/2007 11:17'!

subjectPublicKeyDecoded



	^ ASN1Stream decodeBytes: self subjectPublicKey bytes.

! !

