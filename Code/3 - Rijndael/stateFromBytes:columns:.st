
!Rijndael methodsFor: 'setup' stamp: 'len 8/15/2002 01:14'!
stateFromBytes: aByteArray columns: numberOfColumns
	aByteArray size = (4 * numberOfColumns) ifFalse: [^ self error: 'wrong block size'].
	^ (1 to: numberOfColumns) collect: [:k | ThirtyTwoBitRegister loadFrom: aByteArray at: (k-1)*4 + 1]! !
