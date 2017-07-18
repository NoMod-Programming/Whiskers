
!ASN1Module methodsFor: 'definitions - mapped' stamp: 'rww 3/30/2007 23:43'!
implicit: aSymbol type: type tag: tag

	^ (ASN1ImplicitSubType name: aSymbol in: self)
		parent: type;
		tag: tag;
		yourself
! !
