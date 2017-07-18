
!ASN1WrapperConstructedType methodsFor: 'decoding' stamp: 'rww 4/14/2007 10:28'!
decodeValueWithDERStream: derStream length: length

	| aValue sequence stopPosition |
	length = -1
		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].
	aValue := ASN1ExplicitContextValue new.
	aValue tagIndex: (derStream currentTag bitAnd: 2r00011111).
	aValue tagIsPrimitive: false.
	sequence := OrderedCollection new.
	stopPosition := derStream position + length.
	[derStream position < stopPosition] whileTrue: [
		sequence add: derStream decode].
	aValue tagValue: sequence.
	^aValue
	
! !
