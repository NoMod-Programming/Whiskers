

!ASN1ChoiceType methodsFor: 'decoding' stamp: 'acp 5/4/2017 18:11'!

decodeWithDERStream: derStream



	| tag |

	derStream atEnd ifTrue: [^ self error: 'missing element'].

	tag := derStream peekTag.

	(self matchesTag: tag)

		ifTrue: [^ self decodeValueWithDERStream: derStream length: -1]

		ifFalse: [^ self error: 'bad choice'].

! !

