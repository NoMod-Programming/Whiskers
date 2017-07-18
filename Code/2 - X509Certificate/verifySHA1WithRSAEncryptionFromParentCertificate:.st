
!X509Certificate methodsFor: 'verifying' stamp: 'rww 10/16/2016 19:27'!
verifySHA1WithRSAEncryptionFromParentCertificate: parentCert

	| publicKey hash msg |
	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.

	hash := SHA1 hashMessage: self tbsCertificate asAsn1DerBytes.
	msg := OrderedCollection new
		add: (OrderedCollection new add: (ASN1ObjectId fromString: '1.3.14.3.2.26'); add: nil; yourself);
		add: hash;
		asAsn1DerBytes.
	^ publicKey v15VerifySignature: self signature bytes ofMessageHash: msg.
! !
