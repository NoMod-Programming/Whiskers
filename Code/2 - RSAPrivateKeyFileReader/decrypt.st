
!RSAPrivateKeyFileReader methodsFor: 'initialization' stamp: 'rww 3/30/2007 14:17'!
decrypt

	| cipher key block encryptedStream decryptedStream |
	self password isNil 
		ifTrue: [self password: (FillInTheBlank requestPassword: 'Enter your password')].
	key := OpenSSLKeyDerivationFunction new 
		derivedKeyFromPassword: self password 
		salt: self iv 
		size: 24.
	cipher := (TripleDES key: key) cbc initialVector: iv.
	encryptedStream := self bytes readStream.
	decryptedStream := ReadWriteStream on: (ByteArray new: encryptedStream size).
	[encryptedStream atEnd] whileFalse: 
		[block := encryptedStream next: 8.
		cipher decryptBlock: block.
		decryptedStream nextPutAll: block].
	self decryptedBytes: decryptedStream contents.
! !
