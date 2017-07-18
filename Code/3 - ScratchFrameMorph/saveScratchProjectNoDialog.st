
!ScratchFrameMorph methodsFor: 'file read/write' stamp: 'EMP 7/17/2017 20:48'!
saveScratchProjectNoDialog

	| fName dir |
	self closeMediaEditorsAndDialogs ifFalse: [^ self].

	projectName ifNil: [projectName := ''].
	fName := self nameFromFileName: projectName.

	dir := ScratchFileChooserDialog getLastFolderForType: #project.
	(fName size = 0 | (dir fileExists: fName , '.sb2') not) ifTrue: [^ self saveScratchProject].
	ScratchFileChooserDialog lastFolderIsSampleProjectsFolder ifTrue:  [^ self saveScratchProject].

	self updateLastHistoryEntryIfNeeded.

	projectName := FileDirectory localNameFor: (fName, '.sb2').  "ignore path, if any; save in the original project directory"
	projectDirectory := dir.

	self updateHistoryProjectName: projectName op: 'save'.
	self writeScratchProject.
! !
