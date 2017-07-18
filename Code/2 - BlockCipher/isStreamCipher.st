
!BlockCipher methodsFor: 'testing' stamp: 'cmm 3/2/2006 23:50'!
isStreamCipher
	"Answer whether I have stream characteristics; a Stream cipher typically generates its own stream of pseudo-random bytes which is then XOR'd with plaintext.  Another characteristic is no padding is required because the last (odd-sized) block can simply XOR to whatever length needed."
	^ false! !
