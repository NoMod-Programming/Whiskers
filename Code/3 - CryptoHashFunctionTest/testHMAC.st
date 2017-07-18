
!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'rww 10/5/2006 06:45'!
testHMAC
	self assert: (MD5 new hmac key: (ByteArray new: 16 withAll: 16r0B); digestMessage: 'Hi There' asByteArray) asInteger = 16r9294727A3638BB1C13F48EF8158BFC9D.
	self assert: (MD5 new hmac key: 'Jefe' asByteArray; digestMessage: 'what do ya want for nothing?' asByteArray) asInteger = 16r750C783E6AB0B503EAA86E310A5DB738.
	self assert: (MD5 new hmac key: (ByteArray new: 16 withAll: 16rAA); digestMessage: (ByteArray new: 50 withAll: 16rDD)) asInteger = 16r56BE34521D144C88DBB8C733F0E8B3F6! !
