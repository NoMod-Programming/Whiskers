

!CryptoASN1Test methodsFor: 'tests - base' stamp: 'rww 3/28/2007 11:30'!

testBitString



	| bytes obj newBytes testObj |

	bytes := #(3 3 3 168 121).

	testObj := ASN1BitString new 

		bytes: #(168 121); 

		bitsPadding: 3; 

		yourself.

	obj := ASN1Stream decodeBytes: bytes.

	self assert: (obj = testObj).

	newBytes := ASN1Stream encode: obj.

	self assert: (bytes asByteArray = newBytes).

! !

