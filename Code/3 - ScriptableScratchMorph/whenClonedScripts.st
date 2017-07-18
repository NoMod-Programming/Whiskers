
!ScriptableScratchMorph methodsFor: 'other ops' stamp: 'EMP 7/17/2017 17:01'!
whenClonedScripts
	^ self scripts
			select: [:t1 | t1 isWhenCloneHat & t1 nextBlock notNil]! !
