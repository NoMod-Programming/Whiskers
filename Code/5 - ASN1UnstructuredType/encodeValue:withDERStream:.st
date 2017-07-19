

!ASN1UnstructuredType methodsFor: 'encoding' stamp: 'rww 3/25/2007 18:01'!

encodeValue: anObject withDERStream: derStream



	anObject do: [:each |

		self elementType 

			encode: each 

			withDERStream: derStream].

! !

