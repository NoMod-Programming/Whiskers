
!ProcedureHatBlockMorph methodsFor: 'private-evaluation' stamp: 'EMP 7/17/2017 09:50'!
start
	| stage |
	self stop.
	scratchProc ifNil: [
		runningMouse _ true.
		scriptOwner ifNil: [^ self].
		(stage _ self receiver ownerThatIsA: ScratchStageMorph) ifNil: [^ self].
		scratchProc _ stage startProcessFor: self.
		self changed].! !
