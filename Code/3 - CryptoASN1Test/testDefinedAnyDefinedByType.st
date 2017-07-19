

!CryptoASN1Test methodsFor: 'tests - defined types' stamp: 'rww 3/28/2007 11:31'!

testDefinedAnyDefinedByType



	| bytes obj newBytes type |

	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)

		add: #testSlot1 type: #ASN1ObjectIdentifierType;

		add: #testSlot2 type: #TestAnyDefinedBy;

		yourself.

	((ASN1Module name: #test) any: #TestAnyDefinedBy definedBy: #testSlot1)

		at: (ASN1ObjectId fromString: '1.1') put: #ASN1BooleanType;

		at: (ASN1ObjectId fromString: '1.2') put: #ASN1IntegerType;

		yourself.



	type := (ASN1Module name: #test) find: #TestSequence.



	bytes := #(48 6 6 1 41 1 1 255).

	obj := ASN1Stream decodeBytes: bytes withType: type.

	self assert: (obj isKindOf: ASN1TestModel).

	self assert: (obj testSlot1 = (ASN1ObjectId fromString: '1.1')).

	self assert: (obj testSlot2 = true).

	newBytes := ASN1Stream encode: obj withType: type.

	self assert: (bytes asByteArray = newBytes).



	bytes := #(48 7 6 1 42 2 2 3 21).

	obj := ASN1Stream decodeBytes: bytes withType: type.

	self assert: (obj isKindOf: ASN1TestModel).

	self assert: (obj testSlot1 = (ASN1ObjectId fromString: '1.2')).

	self assert: (obj testSlot2 = 789).

	newBytes := ASN1Stream encode: obj withType: type.

	self assert: (bytes asByteArray = newBytes).

! !

