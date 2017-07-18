
!OFB methodsFor: 'accessing' stamp: 'cmm 3/1/2006 23:02'!
encryptBlock: aByteArray
	self advanceVector.
	aByteArray withIndexDo:
		[ : eachByte : x |
		aByteArray 
			at: x
			put: ((aByteArray at: x) bitXor: (vector at: x)) ]! !
