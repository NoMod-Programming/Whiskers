
!ScriptableScratchMorph methodsFor: 'list ops' stamp: 'EMP 7/16/2017 19:20'!
showList: aListName
	| list sFrame stage |
	stage := self ownerOrYourselfThatIsA: ScratchStageMorph.
	(self listVarNames includes: aListName)
		ifTrue: [list := lists at: aListName]
		ifFalse: 
			[stage ifNil: [^ self].
			(stage listVarNames includes: aListName)
				ifTrue: [list _ stage lists at: aListName]
				ifFalse: [^ self]].
	stage addMorph: list.
	(sFrame _ self ownerScratchFrame) ifNil: [^ self].
	sFrame viewerPane categoryChanged: 'Data'! !
