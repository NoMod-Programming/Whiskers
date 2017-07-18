
!CTR methodsFor: 'initialization-release' stamp: 'cmm 5/11/2006 16:52'!
counterBits: anInteger
	((16 to: 128 by: 16) includes: anInteger) ifFalse:
		[ CryptographyError signal: 'invalid counter size' ].
	counterBits := anInteger.
	maximumCounterValue := (1 bitShift: counterBits) - 1! !
