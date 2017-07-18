
!CryptoASN1Test methodsFor: 'tests - defined types' stamp: 'rww 3/28/2007 11:31'!
testDefinedImplicitPrimitiveType

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1IntegerType implicitTag: 0;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 4 128 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).
! !
