
!CryptoASN1Test methodsFor: 'tests - mapped' stamp: 'rww 3/28/2007 11:32'!
testDefinedMappedBooleanType

	| bytes obj newBytes type |
	((ASN1Module name: #test) mapped: #TestMapped)
		mapping: ASN1TestModel mappingSymbol: #testSlot1 type: #ASN1BooleanType.
	type := (ASN1Module name: #test) find: #TestMapped.

	bytes := #(1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).
! !
