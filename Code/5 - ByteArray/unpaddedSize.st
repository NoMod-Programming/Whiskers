
!ByteArray methodsFor: '*cryptography-core' stamp: 'cmm 3/4/2006 15:08'!
unpaddedSize
	"If I was padded by a BlockCipher, answer the size of the original plaintext."
	self isProperlyPadded ifFalse: [ CryptographyError signal: 'Authentication failure (improperly padded!!)' ].
	^ self size - self last! !
