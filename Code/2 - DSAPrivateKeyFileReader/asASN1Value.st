
!DSAPrivateKeyFileReader methodsFor: 'converting' stamp: 'rww 3/28/2007 11:17'!
asASN1Value

	self decryptedBytes isNil 
		ifTrue: [self decrypt].
	^ ASN1Stream decodeBytes: self decryptedBytes
! !
