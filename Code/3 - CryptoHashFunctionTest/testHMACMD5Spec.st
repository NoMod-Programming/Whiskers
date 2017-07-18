
!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'rww 10/1/2016 19:11'!
testHMACMD5Spec

	self assert: ((MD5 new hmac key: '' asByteArray; digestMessage: '' asByteArray) asByteArray) = 16r74e6f7298a9c2d168935f58c001bad88 asByteArray.
	self assert: ((MD5 new hmac key: 'key' asByteArray; digestMessage: 'The quick brown fox jumps over the lazy dog' asByteArray) asByteArray) = 16r80070713463e7749b90c2dc24911e275 asByteArray.

! !
