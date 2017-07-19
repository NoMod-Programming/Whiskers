

!DESNonPrimitive methodsFor: 'encryption/decryption' stamp: 'hmm 10/2/2006 21:30'!

encryptBlock: anInteger

	| permuted encoded |

	permuted := IP permute: anInteger.

	encoded := self coreProcess: permuted forward: true.

	^IIP permute: encoded! !

