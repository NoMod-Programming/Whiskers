

!ASN1StructuredType methodsFor: 'accessing - element construction' stamp: 'rww 3/23/2007 14:52'!

add: aSymbol type: type



	^self addElement: (

		self newElement

			symbol: aSymbol;

			type: (self typeFrom: type))! !

