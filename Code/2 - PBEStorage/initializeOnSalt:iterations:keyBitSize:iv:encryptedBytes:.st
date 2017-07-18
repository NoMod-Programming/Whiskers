
!PBEStorage methodsFor: 'initialize-release' stamp: 'rww 10/20/2016 11:59'!
initializeOnSalt: mySalt iterations: myIterations keyBitSize: myKeyBitSize iv: myIv encryptedBytes: myEncryptedBytes

	salt := mySalt.
	iterations := myIterations.
	keyBitSize := myKeyBitSize.
	iv := myIv.
	encryptedBytes := myEncryptedBytes.! !
