
!CBC methodsFor: 'accessing' stamp: 'cmm 1/3/2007 20:49'!
decryptBlock: aByteArray 
	| nextVector |
	nextVector := aByteArray copy.
	cipher decryptBlock: aByteArray.
	1 
		to: aByteArray size
		do: 
			[ : i | 
			aByteArray 
				at: i
				put: ((vector at: i) bitXor: (aByteArray at: i)) ].
	self vector: nextVector! !
