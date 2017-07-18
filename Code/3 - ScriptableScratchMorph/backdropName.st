
!ScriptableScratchMorph methodsFor: 'looks ops' stamp: 'EMP 7/16/2017 19:27'!
backdropName
	| stage |
	^ (stage := self ownerOrYourselfThatIsA: ScratchStageMorph) costumeNameFromNumber: (stage costumeIndex)! !
