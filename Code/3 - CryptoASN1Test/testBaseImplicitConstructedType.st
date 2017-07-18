
!CryptoASN1Test methodsFor: 'tests - defined types' stamp: 'rww 3/31/2007 00:25'!
testBaseImplicitConstructedType

	| bytes obj newBytes type |
	(ASN1Module name: #test) implicit: #TestImplicit type: #ASN1SequenceType tag: 0.

	type := (ASN1Module name: #test) find: #TestImplicit.
	bytes := #(160 4 2 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj = (OrderedCollection with: 789)).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).
! !
