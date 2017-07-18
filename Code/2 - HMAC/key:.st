
!HMAC methodsFor: 'accessing' stamp: 'len 10/16/2002 16:47'!
key: aByteArray
	key := aByteArray.
	key size > hash blockSize ifTrue: [key := hash hashMessage: key].
	key size < hash blockSize ifTrue: [key := key, (ByteArray new: hash blockSize - key size)]! !
