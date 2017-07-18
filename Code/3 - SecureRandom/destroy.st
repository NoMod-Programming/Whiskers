
!SecureRandom methodsFor: 'initialization-release' stamp: 'cmm 2/14/2006 23:55'!
destroy
	key destroy.
	key := 0.
	seed := 0! !
