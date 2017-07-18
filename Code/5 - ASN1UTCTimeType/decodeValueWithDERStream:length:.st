
!ASN1UTCTimeType methodsFor: 'decoding' stamp: 'RobertWithers 10/16/2016 21:07'!
decodeValueWithDERStream: derStream length: length

	| aUTCDateTime |
	aUTCDateTime := (derStream next: length) asByteArray asString.
	^ (DateAndTime readFromString: (
		((aUTCDateTime copyFrom: 1 to: 2) asInteger > 50 ifTrue: ['19'] ifFalse: ['20']),
		(aUTCDateTime copyFrom: 1 to: 2), '-',
		(aUTCDateTime copyFrom: 3 to: 4), '-',
		(aUTCDateTime copyFrom: 5 to: 6), 'T',
		(aUTCDateTime copyFrom: 7 to: 8), ':',
		(aUTCDateTime copyFrom: 9 to: 10), ':',
		(aUTCDateTime copyFrom: 11 to: 12), 'Z'))
			offset: 0
! !
