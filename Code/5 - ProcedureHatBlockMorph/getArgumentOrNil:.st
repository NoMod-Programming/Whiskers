
!ProcedureHatBlockMorph methodsFor: 'private-evaluation' stamp: 'EMP 7/17/2017 09:50'!
getArgumentOrNil: selector
	^ vars at: selector ifAbsent: [nil]! !
