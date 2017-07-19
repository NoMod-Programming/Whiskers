

!ASN1ChoiceElement methodsFor: 'decoding' stamp: 'rww 3/26/2007 05:32'!

decodeWithDERStream: derStream



	| tag |

	derStream atEnd ifTrue: [^ self error: 'missing element'].

	tag := derStream peekTag.

	(self matchesTag: tag)

		ifTrue: [^ type decodeWithDERStream: derStream]

		ifFalse: [^ self error: 'bad choice'].

! !

