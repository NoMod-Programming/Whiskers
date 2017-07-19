

!ASN1ChoiceType methodsFor: 'decoding' stamp: 'acp 5/4/2017 18:10'!

decodeValueWithDERStream: derStream length: length



	| aTag ele | 

	aTag := derStream peekTag.

	ele := self elements

		detect: [:x | x matchesTag: aTag]

		ifNone: [self error: 'no choice'].

	^ ele decodeWithDERStream: derStream.

! !

