
!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'rww 10/5/2006 06:46'!
testSHA1
	self assert: (SHA1 hashMessage: 'abc') asInteger = 16rA9993E364706816ABA3E25717850C26C9CD0D89D.
	self assert: (SHA1 hashMessage: 'abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq') asInteger = 16r84983E441C3BD26EBAAE4AA1F95129E5E54670F1
! !
