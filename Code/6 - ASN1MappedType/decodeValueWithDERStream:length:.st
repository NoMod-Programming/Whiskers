

!ASN1MappedType methodsFor: 'decoding' stamp: 'rww 4/14/2007 10:53'!

decodeValueWithDERStream: derStream length: length



	| stopPosition target elementStream ele |

	length = -1

		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].

	stopPosition := derStream position + length.

	target := self mapping new.

	elementStream := self elements readStream.

	[elementStream atEnd or: [derStream position >= stopPosition]] 

		whileFalse: [

			ele := elementStream next.

			ele decode: target withDERStream: derStream].

	[elementStream atEnd] 

		whileFalse: [

			ele := elementStream next.

			ele hasDefault ifTrue: [ele value: ele default into: target].

			ele hasDefaultOrIsOptional

				ifFalse: [self error: 'missing element'] ].

	derStream position < stopPosition ifTrue: [self error: 'invalid length'].

	^ target

! !

