

!CryptoASN1Test methodsFor: 'tests - mapped' stamp: 'rww 3/28/2007 11:30'!

testDefinedMappedIntegerType



	| bytes obj newBytes type |

	((ASN1Module name: #test) mapped: #TestMapped)

		mapping: ASN1TestModel mappingSymbol: #testSlot1 type: #ASN1IntegerType.

	type := (ASN1Module name: #test) find: #TestMapped.



	bytes := #(2 2 3 21).

	obj := ASN1Stream decodeBytes: bytes withType: type.

	self assert: (obj isKindOf: ASN1TestModel).

	self assert: (obj testSlot1 = 789).

	newBytes := ASN1Stream encode: obj withType: type.

	self assert: (bytes asByteArray = newBytes).

! !

