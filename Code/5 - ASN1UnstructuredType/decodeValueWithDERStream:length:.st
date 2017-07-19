

!ASN1UnstructuredType methodsFor: 'decoding' stamp: 'rww 4/14/2007 10:37'!

decodeValueWithDERStream: derStream length: length



	| coll end obj |

	length = -1

		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].

	coll := self containerClass new.

	end := derStream position + length.

	[derStream position < end ] whileTrue: [

		obj := self elementType decodeWithDERStream: derStream.

		coll add: obj].

	^coll! !

