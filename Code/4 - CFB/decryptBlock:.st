
!CFB methodsFor: 'accessing' stamp: 'cmm 1/3/2007 21:11'!
decryptBlock: aByteArray 
	| nextVector |
	nextVector := aByteArray copy.
	cipher encryptBlock: vector.
	1 
		to: aByteArray size
		do: 
			[ : i | 
			aByteArray 
				at: i
				put: ((vector at: i) bitXor: (aByteArray at: i)) ].
	self vector: nextVector! !
