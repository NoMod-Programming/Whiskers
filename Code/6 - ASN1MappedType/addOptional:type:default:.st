
!ASN1MappedType methodsFor: 'accessing - element construction' stamp: 'rww 3/24/2007 07:07'!
addOptional: aSymbol type: type default: anObject

	^(self add: aSymbol type: type)
		optional: true;
		default: anObject;
		yourself.
! !
