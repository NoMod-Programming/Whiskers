

!Rijndael methodsFor: 'setup' stamp: 'len 8/15/2002 01:27'!

storeState: anArray into: aByteArray

	anArray withIndexDo: [ :register :k | register storeInto: aByteArray at: (k-1)*4 + 1]! !

