
!CryptoASN1Test methodsFor: 'tests - base' stamp: 'rww 3/28/2007 11:33'!
testTeletexString

	| bytes obj newBytes testObj |
	bytes := #(20 11 104 101 108 108 111 32 119 111 114 108 100).
	testObj := 'hello world'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
! !
