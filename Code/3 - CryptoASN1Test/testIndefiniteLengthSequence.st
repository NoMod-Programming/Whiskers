
!CryptoASN1Test methodsFor: 'tests - BER' stamp: 'rww 3/28/2007 11:29'!
testIndefiniteLengthSequence

	| bytes obj testObj |
	bytes := #(48 128 1 1 255 2 2 3 21 4 2 108 100 0 0).
	testObj := OrderedCollection new
		add: true;
		add: 789;
		add: #(108 100) asByteArray;
		yourself.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
! !
