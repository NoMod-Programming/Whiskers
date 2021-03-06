
!ScriptableScratchMorph methodsFor: 'variables' stamp: 'EMP 7/13/2017 19:08'!
deleteVariable: varName
	"Delete the variable with the given name. Do nothing if the variable doesn't exist."

	| frame |
	frame := self ownerScratchFrame.
	frame ifNotNil: [frame deleteWatchersForVar: varName ofSprite: self].
	vars removeKey: varName asString ifAbsent: [^ self].
	self isClone: false.

	frame viewerPane categoryChanged: 'Data'.
! !
