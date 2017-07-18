
!ASN1ChoiceType methodsFor: 'encoding' stamp: 'acp 5/3/2017 23:54'!
encodeValue: obj withDERStream: derStream

	| ele |
	ele := self elements
		detect: [:x | x isTypeFor: obj]
		ifNone: [self error: 'no choice']. 
	ele encode: obj withDERStream: derStream.
! !
