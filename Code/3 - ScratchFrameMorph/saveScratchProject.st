
!ScratchFrameMorph methodsFor: 'file read/write' stamp: 'EMP 7/17/2017 22:52'!
saveScratchProject

	| fName result |
	self closeMediaEditorsAndDialogs ifFalse: [^ self].
	self stopAll.

	fName := ScratchFileChooserDialog saveScratchFileFor: self.
	(fName size = 0 or: [fName = #cancelled]) ifTrue: [^ self].

	[(result := ScratchFileChooserDialog confirmFileOverwriteIfExisting: fName) = false] whileTrue: [
		fName := ScratchFileChooserDialog saveScratchFileFor: self.
		(fName size = 0 or: [fName = #cancelled]) ifTrue: [^ self]].
	(result = #cancelled) ifTrue: [^ self].

	self updateLastHistoryEntryIfNeeded.

	fName := (self nameFromFileName: fName), '.sb2'.
	projectDirectory := FileDirectory on: (FileDirectory dirPathFor: fName).
	projectName := FileDirectory localNameFor: fName.

	projectInfo at: 'author' put: author.
	self updateHistoryProjectName: projectName op: 'save'.
	self writeScratchProject.
! !
