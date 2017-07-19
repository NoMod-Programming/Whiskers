

!CryptoASN1Test methodsFor: 'tests - defined types' stamp: 'rww 3/31/2007 00:26'!

testBaseExplicitType



	| bytes obj newBytes type |

	(ASN1Module name: #test) explicit: #TestExplicit type: #ASN1IntegerType tag: 0.



	type := (ASN1Module name: #test) find: #TestExplicit.

	bytes := #(160 4 2 2 3 21).

	obj := ASN1Stream decodeBytes: bytes withType: type.

	self assert: (obj = 789).

	newBytes := ASN1Stream encode: obj withType: type.

	self assert: (bytes asByteArray = newBytes).

! !

