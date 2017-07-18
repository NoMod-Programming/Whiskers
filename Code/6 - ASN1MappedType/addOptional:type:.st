
!ASN1MappedType methodsFor: 'accessing - element construction' stamp: 'rww 3/23/2007 16:28'!
addOptional: aSymbol type: type

	^(self add: aSymbol type: type)
		optional: true;
		yourself.
! !
