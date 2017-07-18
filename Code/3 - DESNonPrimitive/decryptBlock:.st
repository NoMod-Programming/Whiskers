
!DESNonPrimitive methodsFor: 'encryption/decryption' stamp: 'hmm 10/2/2006 21:30'!
decryptBlock: anInteger
	| permuted encoded |
	permuted := IP permute: anInteger.
	encoded := self coreProcess: permuted forward: false.
	^IIP permute: encoded! !
