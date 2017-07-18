
!CryptoASN1Test methodsFor: 'tests - BER' stamp: 'rww 3/28/2007 11:32'!
testConstructedTeletexString

	| bytes obj testObj |
	bytes := #(52 15 20 5 84 101 115 116 32 20 6 85 115 101 114 32 49).
	testObj := 'Test User 1'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
! !
