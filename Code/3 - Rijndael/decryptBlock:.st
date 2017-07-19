

!Rijndael methodsFor: 'accessing' stamp: 'len 8/15/2002 01:18'!

decryptBlock: aByteArray

	state := self stateFromBytes: aByteArray.

	self decryptState: state.

	self storeState: state into: aByteArray! !

