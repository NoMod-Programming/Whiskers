

!Pkcs12PFX class methodsFor: 'class initialization' stamp: 'rww 4/13/2007 22:09'!

initializeASN1Types



	| module |

	module := ASN1Module name: #pkcs.

	module addImport: (ASN1Module name: #x509).



	(module sequence: #PFX mapping: Pkcs12PFX)

		add: #version type: #ASN1IntegerType;

		add: #authSafe type: #ContentInfo;

		addOptional: #macData type: #MacData;

		yourself.



	(module sequence: #ContentInfo mapping: PkcsContentInfo)

		add: #contentType type: #ContentType;

		add: #content type: #ContentInfoContents explicitTag: 0;

		yourself.

	module objectIdentifier: #ContentType.

	(module any: #ContentInfoContents definedBy: #contentType)

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.7.1') put: #ASN1ByteArrayType;

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.7.6') put: #EncryptedData;

		yourself.

	(module sequence: #EncryptedData mapping: PkcsEncryptedData)

		add: #version type: #ASN1IntegerType;

		add: #encryptedContentInfo type: #EncryptedContentInfo;

		yourself.

	(module sequence: #EncryptedContentInfo mapping: PkcsEncryptedContentInfo)

		add: #contentType type: #ContentType;

		add: #contentEncryptionAlgorithm type: #AlgorithmIdentifier;

		addOptional: #encryptedContent type: #EncryptedContent implicitTag: 0;

		yourself.

	module byteArray: #EncryptedContent.



	(module sequence: #MacData mapping: Pkcs12MacData)

		add: #mac type: #DigestInfo;

		add: #macSalt type: #ASN1ByteArrayType;

		add: #iterations type: #ASN1IntegerType default: 1;

		yourself.

	(module sequence: #DigestInfo mapping: PkcsDigestInfo)

		add: #digestAlgorithm type: #AlgorithmIdentifier;

		add: #digest type: #Digest;

		yourself.

	module byteArray: #Digest.

	module sequence: #AuthenticatedSafe of: #ContentInfo.

	module sequence: #SafeContents of: #SafeBag.

	(module sequence: #SafeBag mapping: Pkcs12SafeBag)

		add: #bagId type: #ASN1ObjectIdentifierType;

		add: #bagValue type: #BagTypeChoice explicitTag: 0;

		add: #bagAttributes type: #BagAttributes;

		yourself.

	module set: #BagAttributes of: #ASN1SequenceType.

	(module any: #BagTypeChoice definedBy: #bagId)

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.12.10.1.1') put: #KeyBag;

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.12.10.1.2') put: #ShroudedKeyBag;

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.12.10.1.3') put: #CertBag;

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.12.10.1.4') put: #CRLBag;

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.12.10.1.5') put: #SecretBag;

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.12.10.1.6') put: #SafeContents;

		yourself.

	module assign: #KeyBag from: #PrivateKeyInfo.

	module assign: #ShroudedKeyBag from: #EncryptedPrivateKeyInfo.

	(module sequence: #PrivateKeyInfo mapping: Pkcs8PrivateKeyInfo)

		add: #version type: #ASN1IntegerType;

		add: #privateKeyAlgorithm type: #AlgorithmIdentifier;

		add: #privateKey type: #ASN1ByteArrayType;

		addOptional: #attributes type: #PrivateKeyInfoAttributes implicitTag: 0;

		yourself.

	module set: #PrivateKeyInfoAttributes of: #ASN1SequenceType.

	(module sequence: #EncryptedPrivateKeyInfo mapping: Pkcs8EncryptedPrivateKeyInfo)

		add: #encryptionAlgorithm type: #AlgorithmIdentifier;

		add: #encryptedData type: #ASN1ByteArrayType;

		yourself.

	(module sequence: #CertBag mapping: Pkcs12CertBag)

		add: #certId type: #ASN1ObjectIdentifierType;

		add: #certValue type: #CertBagTypeChoice explicitTag: 0;

		yourself.

	(module any: #CertBagTypeChoice definedBy: #certId)

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.9.22.1') put: #ASN1ByteArrayType;

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.9.22.2') put: #ASN1IA5StringType;

		yourself.

	(module sequence: #CRLBag mapping: Pkcs12CRLBag)

		add: #crlId type: #ASN1ObjectIdentifierType;

		add: #crlValue type: #CRLBagTypeChoice explicitTag: 0;

		yourself.

	(module choice: #CRLBagTypeChoice)

		add: (ASN1ObjectId fromString: '1.2.840.113549.1.9.22.1') type: #ASN1ByteArrayType;

		yourself.

	(module sequence: #SecretBag mapping: Pkcs12SecretBag)

		add: #secretId type: #ASN1ObjectIdentifierType;

		add: #secretValue type: #SecretBagTypeChoice explicitTag: 0;

		yourself.

	(module choice: #SecretBagTypeChoice)

		yourself.





! !

