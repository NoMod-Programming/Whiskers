

!CryptoASN1Test methodsFor: 'tests - defined types' stamp: 'rww 3/28/2007 11:29'!

testDefinedExplicitType



	| bytes obj newBytes type |

	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)

		add: #testSlot1 type: #ASN1IntegerType explicitTag: 0;

		yourself.



	type := (ASN1Module name: #test) find: #TestSequence.

	bytes := #(48 6 160 4 2 2 3 21).

	obj := ASN1Stream decodeBytes: bytes withType: type.

	self assert: (obj isKindOf: ASN1TestModel).

	self assert: (obj testSlot1 = 789).

	newBytes := ASN1Stream encode: obj withType: type.

	self assert: (bytes asByteArray = newBytes).

! !

