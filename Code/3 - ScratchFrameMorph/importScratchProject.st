
!ScratchFrameMorph methodsFor: 'file read/write' stamp: 'EMP 7/16/2017 12:56'!
importScratchProject
	"Allow the user to select a project to open, then merge that project's sprites with the
current project."

	| response |
	self closeMediaEditorsAndDialogs ifFalse: [^ self].
	self stopAll.

	response := ScratchFileChooserDialog
		chooseExistingFileType: #project
		extensions: #(scratch sb sb2)
		title: 'Import Project'.
	response ifNil: [^ self].

	self importSpriteOrProject: response.
! !
