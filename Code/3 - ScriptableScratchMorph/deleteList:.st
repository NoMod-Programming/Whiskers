
!ScriptableScratchMorph methodsFor: 'list ops' stamp: 'EMP 7/13/2017 19:07'!
deleteList: listName
	"Delete the list variable with the given name. Do nothing if the variable doesn't exist."

	| stage sFrame |
	stage := self ownerOrYourselfThatIsA: ScratchStageMorph.
	lists removeKey: listName asString ifAbsent: [].
	stage submorphs do: [:m |
		((m isKindOf: ScratchListMorph) and: 
		[(m listName = listName) and: 
		[m target = self]])
			ifTrue: [m delete]].
	
	sFrame := self ownerScratchFrame.
	sFrame viewerPane categoryChanged: 'Data'
! !
