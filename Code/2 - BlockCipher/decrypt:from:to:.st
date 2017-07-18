
!BlockCipher methodsFor: 'accessing' stamp: 'cmm 5/3/2006 13:06'!
decrypt: aByteArray from: startPos to: endPos 
	"Decrypt aByteArray in-place."
	self 
		blocksIn: aByteArray
		from: startPos
		to: endPos
		do: [:each | self decryptBlock: each].
	^ aByteArray! !
