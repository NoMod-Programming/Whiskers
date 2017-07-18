
!CTR methodsFor: 'initialization-release' stamp: 'cmm 12/13/2006 20:53'!
destroy
	super destroy.
	counter := 0 "avoid potential leakage"! !
