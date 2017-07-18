
!CryptoASN1Test methodsFor: 'tests - base' stamp: 'rww 3/28/2007 11:30'!
testSequence

	| bytes obj newBytes testObj |
	bytes := #(48 11 1 1 255 2 2 3 21 4 2 108 100).
	testObj := OrderedCollection new
		add: true;
		add: 789;
		add: #(108 100) asByteArray;
		yourself.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
! !
