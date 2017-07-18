
!ScriptableScratchMorph methodsFor: 'private' stamp: 'EMP 7/17/2017 13:16'!
findAnySpec: specString
	
	(blocksBin submorphs select: [:submorph | submorph isKindOf: ProcedureHatBlockMorph]) do: [:hatBlock | ((CommandBlockMorph parseCommandSpec: specString asString) = (CommandBlockMorph parseCommandSpec: hatBlock procedure)) ifTrue: [^ true]].
^ false! !
