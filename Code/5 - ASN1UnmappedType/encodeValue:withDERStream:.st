

!ASN1UnmappedType methodsFor: 'encoding' stamp: 'rww 3/27/2007 15:26'!

encodeValue: anObject withDERStream: derStream



	anObject do: [:each |

		derStream encode: each].

! !

