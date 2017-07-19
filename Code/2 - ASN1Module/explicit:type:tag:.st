

!ASN1Module methodsFor: 'definitions - mapped' stamp: 'rww 3/30/2007 23:43'!

explicit: aSymbol type: type tag: tag



	^ (ASN1ExplicitSubType name: aSymbol in: self)

		parent: type;

		tag: tag;

		yourself

! !

