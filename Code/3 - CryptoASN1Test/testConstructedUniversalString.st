

!CryptoASN1Test methodsFor: 'tests - BER' stamp: 'rww 3/28/2007 11:31'!

testConstructedUniversalString



	| bytes obj testObj |

	bytes := #(60 15 28 5 84 101 115 116 32 28 6 85 115 101 114 32 49).

	testObj := 'Test User 1'.

	obj := ASN1Stream decodeBytes: bytes.

	self assert: (obj = testObj).

! !

