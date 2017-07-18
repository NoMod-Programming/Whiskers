
!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'rww 10/5/2006 06:45'!
testHMACSHA1
	self assert: ((SHA1 new hmac key: (ByteArray new: 16 withAll: 16r0B); digestMessage: 'Hi There' asByteArray) asByteArray) = #(16r67 16r5B 16rB 16r3A 16r1B 16r4D 16rDF 16r4E 16r12 16r48 16r72 16rDA 16r6C 16r2F 16r63 16r2B 16rFE 16rD9 16r57 16rE9) asByteArray! !
