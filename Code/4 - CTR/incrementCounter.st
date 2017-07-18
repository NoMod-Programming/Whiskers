
!CTR methodsFor: 'private' stamp: 'cmm 2/28/2006 13:06'!
incrementCounter
	counter >= maximumCounterValue 
		ifTrue:
			[ CryptographyError signal: 'cannot operate on more than ', maximumCounterValue printString, ' blocks at a time.' ].
	self counter: counter + 1! !
