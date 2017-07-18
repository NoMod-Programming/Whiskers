
!WhenGreaterThanHatBlockMorph methodsFor: 'other' stamp: 'EMP 7/16/2017 20:56'!
evaluateCondition
	"Answer true if my condition is true."
	
	scratchProc ifNotNil: [^ false]. "Wait for process to finish"
	lastState ifTrue: [(lastArg asNumberNoError = (argMorph evaluate asNumberNoError)) ifTrue: [^ false]].
	(argMorph evaluate) isNumber ifTrue: [
		lastState := (argMorph evaluate) < (scriptOwner whenTrueGet: (secondArgMorph evaluate) numberTesting: (argMorph evaluate)).
		lastState ifTrue: [^ (argMorph evaluate) < (scriptOwner whenTrueGet: (secondArgMorph evaluate) numberTesting: (argMorph evaluate))] ].
	lastArg _ (argMorph evaluate) asNumberNoError.
	^ false! !
