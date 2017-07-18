
!CTR methodsFor: 'private' stamp: 'cmm 5/11/2006 22:30'!
nonceBits
	"The number of bits left over for the nonce."
	^ (self blockSize*8) - counterBits! !
