
!CryptoASN1Test methodsFor: 'tests - base' stamp: 'rww 3/28/2007 11:31'!
testNull

	| bytes obj newBytes |
	bytes := #(5 0).
	obj := ASN1Stream decodeBytes: bytes.
	self assert: obj isNil.
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
! !
