
!TripleDES methodsFor: 'accessing' stamp: 'len 8/2/2002 15:03'!
key: aByteArray
	des1 key: (aByteArray copyFrom: 1 to: 8).
	des2 key: (aByteArray copyFrom: 9 to: 16).
	des3 key: (aByteArray copyFrom: 17 to: 24)! !
