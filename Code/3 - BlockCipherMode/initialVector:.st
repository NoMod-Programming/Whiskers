
!BlockCipherMode methodsFor: 'accessing' stamp: 'rww 10/17/2016 06:25'!
initialVector: aByteArray

	"avoid leakage, shred prior vectors before disconnecting them."
	self vector: aByteArray! !
