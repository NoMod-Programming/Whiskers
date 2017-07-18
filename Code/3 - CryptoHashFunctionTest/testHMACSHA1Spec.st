
!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'rww 10/1/2016 19:08'!
testHMACSHA1Spec

	self assert: ((SHA1 new hmac key: '' asByteArray; digestMessage: '' asByteArray) asByteArray) = 16rfbdb1d1b18aa6c08324b7d64b71fb76370690e1d asByteArray.
	self assert: ((SHA1 new hmac key: 'key' asByteArray; digestMessage: 'The quick brown fox jumps over the lazy dog' asByteArray) asByteArray) = 16rde7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9 asByteArray.

! !
