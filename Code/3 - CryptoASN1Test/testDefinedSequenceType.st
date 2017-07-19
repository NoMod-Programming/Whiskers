

!CryptoASN1Test methodsFor: 'tests - defined types' stamp: 'rww 3/28/2007 11:32'!

testDefinedSequenceType



	| bytes obj newBytes type |

	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)

		add: #testSlot1 type: #ASN1BooleanType;

		yourself.



	type := (ASN1Module name: #test) find: #TestSequence.

	bytes := #(48 3 1 1 255).

	obj := ASN1Stream decodeBytes: bytes withType: type.

	self assert: (obj isKindOf: ASN1TestModel).

	self assert: (obj testSlot1 = true).

	newBytes := ASN1Stream encode: obj withType: type.

	self assert: (bytes asByteArray = newBytes).

! !

