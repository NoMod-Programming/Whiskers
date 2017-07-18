
!ScriptableScratchMorph methodsFor: 'accessing' stamp: 'EMP 7/16/2017 20:27'!
whenTrueGet: anAttribute numberTesting: number
	anAttribute asString = 'timer' ifTrue: [^ self timer].
	anAttribute asString = 'loudness' ifTrue: [^ self soundLevel].
	^ number asNumberNoError - 1! !
