

!ASN1WrapperConstructedType methodsFor: 'decoding' stamp: 'rww 4/14/2007 11:47'!

decodeValueIndefiniteLengthWithDERStream: derStream



	| contextValue sequence value |

	contextValue := ASN1ExplicitContextValue new.

	contextValue tagIndex: (derStream currentTag bitAnd: 2r00011111).

	contextValue tagIsPrimitive: false.

	sequence := OrderedCollection new.

	[derStream peekTag = 0

		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]

		ifFalse: [value := derStream decode].

	value isKindOf: ASN1EndOfIndefiniteLengthMarker] 

		whileFalse: [sequence add: value].

	contextValue tagValue: sequence.

	^contextValue

	

! !

