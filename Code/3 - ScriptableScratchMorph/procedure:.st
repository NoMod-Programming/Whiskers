
!ScriptableScratchMorph methodsFor: 'accessing' stamp: 'EMP 7/17/2017 15:51'!
procedure: procName

	^ self scripts detect: [:block | (block isMemberOf: ProcedureHatBlockMorph)
					and: [block procedure = procName]]
		ifNone: [nil].! !
