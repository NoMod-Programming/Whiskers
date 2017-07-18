
!CryptoRSATest methodsFor: 'RSA' stamp: 'dik 9/23/2010 11:26'!
derKeys

	| key64 |
	key64 := self encodedBase64Keys.

	^(Base64MimeConverter mimeDecodeToBytes:  key64 readStream ) contents.
! !
