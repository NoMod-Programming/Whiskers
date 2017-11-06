
!ScriptableScratchMorph methodsFor: 'variables' stamp: 'EMP 11/5/2017 18:40'!
getVarReference: varName
	"Make sure that the variable with the given name is visible to this object. Do nothing if the variable already exists."

	| stage |
	(vars includesKey: varName) ifTrue: [^ vars at: varName].
	(stage := self ownerOrYourselfThatIsA: ScratchStageMorph) ifNotNil: [
		(stage vars includesKey: varName) ifTrue: [^ stage vars at: varName]].
	^ nil! !
