
!ScriptableScratchMorph methodsFor: 'list ops' stamp: 'EMP 11/5/2017 20:58'!
addList

	| sFrame result listName |
	sFrame := self ownerScratchFrame ifNil: [^ Beeper beep].

	result := NewVariableDialog ask: 'List name: '.
	result = #cancelled ifTrue: [^ self].
	listName := result first.
	result second
		ifTrue: [self createListNamed: listName]
		ifFalse: [sFrame workPane createListNamed: listName].
	sFrame viewerPane categoryChanged: 'Data'.
! !
