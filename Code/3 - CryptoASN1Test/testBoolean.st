

!CryptoASN1Test methodsFor: 'tests - base' stamp: 'rww 3/28/2007 11:32'!

testBoolean



	| bytes obj newBytes testObj |

	bytes := #(1 1 255).

	testObj := true.

	obj := ASN1Stream decodeBytes: bytes.

	self assert: (obj = testObj).

	newBytes := ASN1Stream encode: obj.

	self assert: (bytes asByteArray = newBytes).

! !

