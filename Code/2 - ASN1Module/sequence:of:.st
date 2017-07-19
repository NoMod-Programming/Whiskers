

!ASN1Module methodsFor: 'definitions - mapped' stamp: 'rww 3/23/2007 12:32'!

sequence: aSymbol of: typeSpec



	^ (ASN1SequenceOfType name: aSymbol in: self)

		elementType: typeSpec;

		yourself! !

