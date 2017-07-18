
!ScriptableScratchMorph methodsFor: 'sensing ops' stamp: 'EMP 7/16/2017 20:27'!
timerReset

	TimerStartMSecs := Time millisecondClockValue.
	WhenGreaterThanHatBlockMorph allInstancesDo: [:inst | inst reset].! !
