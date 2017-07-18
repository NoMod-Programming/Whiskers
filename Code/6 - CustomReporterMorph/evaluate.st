
!CustomReporterMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 11:36'!
evaluate
	| procedureHat arg |
	(procedureHat _ self ownerThatIsA: ProcedureHatBlockMorph) ifNil: [^ ''].
	(arg _ ((procedureHat scratchProc) ifNotNil: [procedureHat scratchProc getArgumentOrNil: (self selector)])) ifNil: [^ '0'].
	^ arg! !
