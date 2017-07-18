
!ASN1WrapperConstructedType methodsFor: 'encoding' stamp: 'rww 4/14/2007 18:09'!
sizeOfObject: anObject

	| derStream |
	derStream := ASN1Stream new.
	anObject tagValue do: [:each |
		derStream encode: each].
	^ derStream size! !
