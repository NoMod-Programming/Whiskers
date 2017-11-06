
!VariableBlockMorph methodsFor: 'menus' stamp: 'EMP 11/5/2017 19:00'!
renameVar
	| newName |
	newName := StringDialog askWithCancel: 'New name: ' initialAnswer: commandSpec title: 'Rename ', commandSpec.
	newName := newName withBlanksTrimmed.
	(receiver variableNameInUse: newName) ifTrue: [
		^ DialogBoxMorph inform: 'That name is already in use.' title: 'Cannot Rename'.
	].
	varReference varName: newName.! !
