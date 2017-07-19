

!ASN1Module methodsFor: 'services' stamp: 'rww 4/12/2007 13:25'!

localFind: aSymbol



	^ self definitions

		at: aSymbol

		ifAbsent: [^ nil].

! !

