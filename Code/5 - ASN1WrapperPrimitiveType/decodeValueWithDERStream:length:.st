

!ASN1WrapperPrimitiveType methodsFor: 'decoding' stamp: 'rww 3/26/2007 06:08'!

decodeValueWithDERStream: derStream length: length



	| aValue |

	aValue := ASN1ExplicitContextValue new.

	aValue tagIndex: (derStream currentTag bitAnd: 2r00011111).

	aValue tagIsPrimitive: true.

	aValue tagValue: (derStream next: length).

	^aValue

	

! !

