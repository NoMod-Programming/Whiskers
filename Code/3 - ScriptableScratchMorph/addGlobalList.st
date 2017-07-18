
!ScriptableScratchMorph methodsFor: 'list ops' stamp: 'EMP 7/13/2017 19:07'!
addGlobalList

	| sFrame listName |
	sFrame := self ownerScratchFrame ifNil: [^ Beeper beep].

	listName := StringDialog ask: 'List name?'.
	listName size = 0 ifTrue: [^ self].
	sFrame workPane createListNamed: listName.
	sFrame viewerPane categoryChanged: 'Data'.
! !
