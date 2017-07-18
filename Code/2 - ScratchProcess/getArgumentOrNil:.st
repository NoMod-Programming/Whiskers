
!ScratchProcess methodsFor: 'private-evaluation' stamp: 'EMP 7/17/2017 16:10'!
getArgumentOrNil: selector
	blockVarList ifNil: [^ 0].
	^ blockVarList last at: selector asString ifAbsent: [0]! !
