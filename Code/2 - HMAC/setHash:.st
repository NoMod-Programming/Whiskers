
!HMAC methodsFor: 'initialization' stamp: 'len 10/16/2002 16:42'!
setHash: aHash
	hash := aHash.
	ipad := ByteArray new: aHash blockSize withAll: 16r36.
	epad := ByteArray new: aHash blockSize withAll: 16r5C! !
