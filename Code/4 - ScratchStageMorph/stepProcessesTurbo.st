
!ScratchStageMorph methodsFor: 'scratch processes/events' stamp: 'EMP 7/18/2017 12:36'!
stepProcessesTurbo
	"Run each Scratch process until it gives up control, then filter out any processes that have terminated. Do this repeatedly until time is up."

	| sliceMSecs startMSecs now proc |
	sliceMSecs := 100.
	inProcessStep ifTrue: [^ self].
	inProcessStep := true.

	startMSecs := Time millisecondClockValue.
	[
		[now := Time millisecondClockValue.
		 runningBlocks size > 0 and:
		  [(now >= startMSecs) and: [(now - startMSecs) < sliceMSecs]]] whileTrue: [
			self processesToRun do: [:p | (proc := p) runStepFor: self].
			self removeTerminatedProcesses].
	] ifError: [proc errorFlag: true].

	inProcessStep := false.
! !
