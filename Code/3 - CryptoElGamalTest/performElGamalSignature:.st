
!CryptoElGamalTest methodsFor: 'ElGamal' stamp: 'rww 10/5/2006 06:47'!
performElGamalSignature: bits
	| elgamal pub priv signature message |
	elgamal := self elGamalGeneratorOfSize: bits.
	pub := elgamal publicKey.
	priv := elgamal privateKey.
	message := SecureRandom picker nextBits: bits.
	signature := priv signMessage: message.
	self assert: (pub verifySignature: signature onMessage: message)! !
