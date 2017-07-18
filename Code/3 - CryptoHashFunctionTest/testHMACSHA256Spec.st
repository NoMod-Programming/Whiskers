
!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'rww 10/1/2016 19:11'!
testHMACSHA256Spec

	self assert: ((SHA256 new hmac key: '' asByteArray; digestMessage: '' asByteArray) asByteArray) = 16rb613679a0814d9ec772f95d778c35fc5ff1697c493715653c6c712144292c5ad asByteArray.
	self assert: ((SHA256 new hmac key: 'key' asByteArray; digestMessage: 'The quick brown fox jumps over the lazy dog' asByteArray) asByteArray) = 16rf7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8 asByteArray.

! !
