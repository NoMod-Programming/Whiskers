

!ASN1Module methodsFor: 'definitions - mapped' stamp: 'rww 3/27/2007 15:40'!

set: aSymbol mapping: mappingClass



	^ (ASN1MappedSetType name: aSymbol in: self)

		mapping: mappingClass;

		yourself! !

