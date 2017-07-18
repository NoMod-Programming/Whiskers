
!CryptoRSATest methodsFor: 'running' stamp: 'dik 9/23/2010 11:31'!
setUp
	| reader |
	super setUp.
	
	reader := RSAPrivateKeyFileReader new.
	reader decryptedBytes: self derKeys.
	privateKey := reader asPrivateKey.
	publicKey := reader asPublicKey.
	! !
