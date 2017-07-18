
!BlockCipherMode methodsFor: 'initialization-release' stamp: 'cmm 5/4/2006 15:33'!
setCipher: aCipher 
	cipher := aCipher.
	self initialVector: (ByteArray new: self blockSize)! !
