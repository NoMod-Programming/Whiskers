
!ScriptableScratchMorph methodsFor: 'variables' stamp: 'EMP 7/13/2017 19:07'!
addGlobalVariable
	"Ask the user for a variable name, then add a background (global) variable of that name."

	| sFrame varName |
	sFrame := self ownerScratchFrame ifNil: [^ Beeper beep].

	varName := StringDialog ask: 'Variable name?'.
	varName size = 0 ifTrue: [^ self].
	varName := varName.
	(sFrame workPane variableNameInUse: varName) ifTrue: [
		Beeper beep.
		DialogBoxMorph warn: 'That variable name is already in use'.
		^ self].

	sFrame workPane addVariable: varName.
	sFrame viewerPane categoryChanged: 'Data'.
	self addWatcherForNewVariable: varName withScope: sFrame workPane.
! !
