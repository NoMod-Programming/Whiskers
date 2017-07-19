

!ASN1StructuredType methodsFor: 'accessing' stamp: 'rww 3/27/2007 16:32'!

elementWithSymbol: aSymbol



	^ self elements

		detect: [:each | each symbol == aSymbol]

		ifNone: [self error: 'no element specified in structured type'].

! !

