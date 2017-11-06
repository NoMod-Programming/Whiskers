
!ScriptableScratchMorph methodsFor: 'variables' stamp: 'EMP 11/5/2017 20:58'!
addVariable
	"Ask the user for a variable name, then add a user variable of that name. This version is for sprites and supports the option of making the variable specific to the sprite (i.e. local)."

	| sFrame result varName varOwner |
	sFrame := self ownerScratchFrame ifNil: [^ Beeper beep].

	result := NewVariableDialog ask: 'Variable name: '.
	result = #cancelled ifTrue: [^ self].
	varName := result first.
	varOwner := result second ifTrue: [self] ifFalse: [sFrame workPane].
	(varOwner variableNameInUse: varName) ifTrue: [
		Beeper beep.
		DialogBoxMorph warn: 'That variable name is already in use'.
		^ self].

	varOwner addVariable: varName.
	sFrame viewerPane categoryChanged: 'Data'.
	self addWatcherForNewVariable: varName withScope: varOwner.
! !
