
!CryptoElGamalTest methodsFor: 'ElGamal' stamp: 'rww 10/5/2006 06:47'!
performElGamalEncryption: bits
	| elgamal pub priv c element |
	elgamal := self elGamalGeneratorOfSize: bits.
	pub := elgamal publicKey.
	priv := elgamal privateKey.
	element := (SecureRandom picker nextBits: bits).
	c := pub encryptElement: element.
	self assert: (priv decryptElement: c) = element! !
