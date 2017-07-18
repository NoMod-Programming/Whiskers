
!CTR methodsFor: 'accessing' stamp: 'cmm 2/8/2006 23:57'!
decryptBlock: aByteArray
	"One of the advantages of CTR mode is that the decrypt implementation is exactly like the encrypt."
	self encryptBlock: aByteArray! !
