

!ASN1Module methodsFor: 'definitions - mapped' stamp: 'rww 3/28/2007 20:03'!

assign: aSymbol from: otherSymbol



	^ (ASN1AssignmentSubType name: aSymbol in: self)

		parent: otherSymbol;

		yourself! !

