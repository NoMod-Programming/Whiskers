

!CryptoASN1Test methodsFor: 'tests - BER' stamp: 'rww 3/28/2007 11:30'!

testConstructedBitString



	| bytes obj testObj |

	bytes := #(35 9 3 3 0 110 93 3 2 6 192).

	testObj := ASN1BitString new

		bytes: #(110 93 192) asByteArray;

		bitsPadding: 6;

		yourself.

	obj := ASN1Stream decodeBytes: bytes.

	self assert: (obj = testObj).

! !

