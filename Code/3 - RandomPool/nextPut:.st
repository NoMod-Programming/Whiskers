
!RandomPool methodsFor: 'as yet unclassified' stamp: 'len 8/20/2002 03:14'!
nextPut: aByte
	| keyIndex |
	inputIndex = pool size ifTrue: [self stir].
	inputIndex := inputIndex \\ pool size + 1.
	pool at: inputIndex put: ((pool at: inputIndex) bitXor: aByte).
	keyIndex := inputIndex \\ key size + 1.
	key at: keyIndex put: ((key at: keyIndex) bitXor: aByte).
	^ aByte! !
