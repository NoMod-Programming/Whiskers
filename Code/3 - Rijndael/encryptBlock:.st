

!Rijndael methodsFor: 'accessing' stamp: 'len 8/15/2002 01:18'!

encryptBlock: aByteArray

	state := self stateFromBytes: aByteArray.

	self encryptState: state.

	self storeState: state into: aByteArray! !

