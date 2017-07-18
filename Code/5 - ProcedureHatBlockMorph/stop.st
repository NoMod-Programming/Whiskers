
!ProcedureHatBlockMorph methodsFor: 'private-evaluation' stamp: 'EMP 7/17/2017 09:51'!
stop
	scratchProc ifNotNil: [
		runningMouse _ false.
		self changed.
		scratchProc stop.
		scratchProc _ nil].! !
