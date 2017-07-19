

!PBEStorage methodsFor: 'converting' stamp: 'rww 10/20/2016 12:15'!

readFrom: stream



	salt := stream next: 8.

	iterations := stream uint32.

	keyBitSize := stream uint32.

	iv := stream next: stream uint16.

	encryptedBytes := stream next: stream uint16.

! !

