

!ASN1ChoiceType methodsFor: 'testing' stamp: 'acp 5/4/2017 18:03'!

isTypeFor: anObject



	^(self elements

		detect: [:x | x isTypeFor: anObject]

		ifNone: [nil]) notNil.! !

