

!DESNonPrimitive methodsFor: 'initialize-release' stamp: 'hmm 10/2/2006 21:46'!

setKeyFromByteArray: aByteArray

	self setKey: ((aByteArray unsignedLongAt: 1 bigEndian: true) bitShift: 32) + (aByteArray unsignedLongAt: 5 bigEndian: true)! !

