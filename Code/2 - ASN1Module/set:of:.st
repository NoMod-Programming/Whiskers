
!ASN1Module methodsFor: 'definitions - mapped' stamp: 'rww 3/23/2007 12:33'!
set: aSymbol of: typeSpec

	^ (ASN1SetOfType name: aSymbol in: self)
		elementType: typeSpec;
		yourself! !
