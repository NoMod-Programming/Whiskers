

!ASN1ChoiceType methodsFor: 'encoding' stamp: 'acp 5/4/2017 22:39'!

encode: anObject withDERStream: derStream



	| tempStream |

	tempStream := derStream newStream.

	self encodeValue: anObject withDERStream: tempStream.

	derStream nextPutAll: tempStream contents.

	^ derStream

! !

