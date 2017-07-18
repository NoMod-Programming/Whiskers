
!CryptoASN1Test methodsFor: 'tests - base' stamp: 'rww 3/28/2007 11:29'!
testInteger

	| bytes obj newBytes testObj |
	bytes := #(2 2 3 21).
	testObj := 789.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
! !
