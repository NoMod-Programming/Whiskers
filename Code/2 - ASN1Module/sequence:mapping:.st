
!ASN1Module methodsFor: 'definitions - mapped' stamp: 'rww 3/27/2007 15:35'!
sequence: aSymbol mapping: mappingClass

	^ (ASN1MappedSequenceType name: aSymbol in: self)
		mapping: mappingClass;
		yourself! !
