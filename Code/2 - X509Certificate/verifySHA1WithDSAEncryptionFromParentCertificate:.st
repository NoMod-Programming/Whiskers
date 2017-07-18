
!X509Certificate methodsFor: 'verifying' stamp: 'rww 10/16/2016 19:25'!
verifySHA1WithDSAEncryptionFromParentCertificate: parentCert

	| publicKey sig toBeSigned |
	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.
	sig := ASN1Stream decodeBytes: self signature bytes.
	toBeSigned := SHA1 hashMessage: self tbsCertificate asAsn1DerBytes.
	^ publicKey verifySignature: sig ofMessageHash: toBeSigned.
! !
