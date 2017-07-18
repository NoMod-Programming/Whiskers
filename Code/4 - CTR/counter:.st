
!CTR methodsFor: 'private' stamp: 'cmm 5/11/2006 23:14'!
counter: anInteger 
	vector 
		uint: counterBits
		at: self positionOfCounter
		put: anInteger.
	counter := anInteger! !
