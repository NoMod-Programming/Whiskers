
!PBEStorage methodsFor: 'converting' stamp: 'rww 10/20/2016 12:14'!
writeTo: stream

	stream nextPutAll: salt.
	stream uint32: iterations.
	stream uint32: keyBitSize.
	stream uint16: iv size.
	stream nextPutAll: iv.
	stream uint16: encryptedBytes size.
	stream nextPutAll: encryptedBytes.
! !
