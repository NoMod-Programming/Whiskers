
!HMAC methodsFor: 'accessing' stamp: 'len 10/16/2002 16:43'!
digestMessage: aByteArray
	^ hash hashMessage: (key bitXor: epad), (hash hashMessage: (key bitXor: ipad), aByteArray)! !
