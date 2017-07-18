
!CryptoASN1Test methodsFor: 'tests - base' stamp: 'rww 10/16/2016 21:21'!
testUTCTime

	| bytes obj newBytes testObj |
	bytes := #[23 13 48 55 48 51 50 50 49 53 53 56 49 55 90].
	testObj := DateAndTime fromString: '2007-03-22T15:58:17+00:00'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
! !
