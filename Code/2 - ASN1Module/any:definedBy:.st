

!ASN1Module methodsFor: 'definitions - mapped' stamp: 'rww 3/27/2007 16:03'!

any: aSymbol definedBy: slotSymbol



	^ (ASN1AnyDefinedByType name: aSymbol in: self)

		definedBy: slotSymbol;

		yourself.

! !

