
!CryptoASN1Test methodsFor: 'tests - base' stamp: 'rww 4/16/2007 15:01'!
testSet

	| bytes obj newBytes testObj |
	bytes := #(49 11 1 1 255 4 2 108 100 2 2 3 21 ).
	testObj := OrderedSet new
		add: true;
		add: #(108 100) asByteArray;
		add: 789;
		yourself.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
! !
