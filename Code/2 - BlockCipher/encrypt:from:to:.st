
!BlockCipher methodsFor: 'accessing' stamp: 'cmm 5/3/2006 13:06'!
encrypt: aByteArray from: startPos to: endPos 
	"Encrypt aByteArray in place."
	self 
		blocksIn: aByteArray
		from: startPos
		to: endPos
		do: [:each | self encryptBlock: each].
	^aByteArray! !
