
!X509TBSCertificate methodsFor: 'initialize-release' stamp: 'rww 10/16/2016 19:28'!
asAsn1DerBytes

	| type |
	type := (ASN1Module name: #x509) find: #TBSCertificate.
	^ ASN1Stream encode: self withType: type
! !
