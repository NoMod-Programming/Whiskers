
!ASN1Module methodsFor: 'services' stamp: 'rww 4/12/2007 13:12'!
primitiveTypeFind: aSymbol

	^ (ASN1Type allSubclasses
		detect: [:class | class name asSymbol = aSymbol]
		ifNone: [^ nil]) new
! !
