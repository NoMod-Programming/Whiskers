

!ASN1ChoiceType methodsFor: 'testing' stamp: 'acp 5/4/2017 18:02'!

matchesTag: anInteger



	^(self elements

		detect: [:x | x matchesTag: anInteger]

		ifNone: [nil]) notNil.! !

