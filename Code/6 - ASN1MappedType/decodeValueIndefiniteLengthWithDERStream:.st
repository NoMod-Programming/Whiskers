

!ASN1MappedType methodsFor: 'decoding' stamp: 'rww 4/14/2007 10:52'!

decodeValueIndefiniteLengthWithDERStream: derStream



	| target elementStream ele value |

	target := self mapping new.

	elementStream := self elements readStream.

	[derStream peekTag = 0

		ifTrue: [value := ASN1EndOfIndefiniteLengthType new decodeWithDERStream: derStream]

		ifFalse: [value := elementStream next decode: target withDERStream: derStream].

	value isKindOf: ASN1EndOfIndefiniteLengthMarker] whileFalse.

	[elementStream atEnd] 

		whileFalse: [

			ele := elementStream next.

			ele hasDefault ifTrue: [ele value: ele default into: target].

			ele hasDefaultOrIsOptional

				ifFalse: [self error: 'missing element'] ].

	^ target

! !

