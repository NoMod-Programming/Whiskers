

!X509Certificate methodsFor: 'verifying' stamp: 'rww 10/16/2016 19:27'!

verifyMD5WithRSAEncryptionFromParentCertificate: parentCert



	| publicKey hash msg |

	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.

	hash := MD5 hashMessage: self tbsCertificate asAsn1DerBytes.

	msg := OrderedCollection new

		add: (OrderedCollection new add: (ASN1ObjectId fromString: '1.2.840.113549.2.5'); add: nil; yourself);

		add: hash;

		asAsn1DerBytes.

	^ publicKey v15VerifySignature: self signature bytes ofMessageHash: msg.

! !

