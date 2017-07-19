

!CryptoASN1Test methodsFor: 'tests - base' stamp: 'rww 3/28/2007 11:33'!

testObjectIdentifier



	| bytes obj newBytes testObj |

	bytes := #(6 8 43 6 1 5 5 7 8 5).

	testObj := ASN1ObjectId new

		oid: '1.3.6.1.5.5.7.8.5';

		yourself.

	obj := ASN1Stream decodeBytes: bytes.

	self assert: (obj = testObj).

	newBytes := ASN1Stream encode: obj.

	self assert: (bytes asByteArray = newBytes).

! !

