
!ScratchProcess methodsFor: 'initialization' stamp: 'EMP 7/17/2017 15:46'!
initialize

	stackFrame := nil.
	readyToYield := false.
	errorFlag := false.
	readyToTerminate := false.
	answer := ''.
	ci := 1.! !
