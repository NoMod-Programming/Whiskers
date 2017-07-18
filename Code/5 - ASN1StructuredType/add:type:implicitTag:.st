
!ASN1StructuredType methodsFor: 'accessing - element construction' stamp: 'rww 3/24/2007 10:40'!
add: aSymbol type: type implicitTag: integer

	^(self add: aSymbol type: type)
		implicitTag: integer;
		yourself.
! !
