

!ASN1Stream methodsFor: 'encoding' stamp: 'rww 3/25/2007 20:15'!

encode: anObject



	| type tag numericTag tagClass isConstructed |

	tag := anObject asn1Tag.

	numericTag := tag bitAnd: 2r00011111.

	tagClass := tag bitAnd: 2r11000000.

	isConstructed := (tag bitAnd: 2r00100000) > 0.

	tagClass > 0

		ifTrue: [isConstructed

			ifTrue: [type := ASN1WrapperConstructedType new]

			ifFalse: [type := ASN1WrapperPrimitiveType new]]

		ifFalse: [type := self class tagToTypeDispatchTable at: numericTag].

	^ self encode: anObject withType: type.

! !

