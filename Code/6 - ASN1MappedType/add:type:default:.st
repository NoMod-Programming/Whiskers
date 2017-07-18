
!ASN1MappedType methodsFor: 'accessing - element construction' stamp: 'rww 3/23/2007 16:25'!
add: aSymbol type: type default: anObject

	^(self add: aSymbol type: type)
		default: anObject;
		yourself.
! !
