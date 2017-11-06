
!ScriptableScratchMorph methodsFor: 'variables' stamp: 'EMP 11/5/2017 19:39'!
getVar: varName
	"Answer the value of the given user variable of this object, or 0 if the variable has been deleted."
	(varName isScratchVariable) ifTrue: [^ self getVar: varName varName].
	^ (vars at: varName asString ifAbsent: [^ 0]) varValue! !
