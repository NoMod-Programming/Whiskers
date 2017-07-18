
!CryptoASN1Test methodsFor: 'tests - defined types' stamp: 'rww 3/28/2007 11:30'!
testDefinedSequenceOfType

	| bytes obj newBytes type |
	(ASN1Module name: #test) sequence: #TestSequence of: #ASN1BooleanType.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: OrderedCollection).
	self assert: (obj first = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).
! !
