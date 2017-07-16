
!ScratchFrameMorph methodsFor: 'private' stamp: 'EMP 7/14/2017 21:53'!
updateProjectName
	"Update the project name display in the Scratch title bar."

	| s |
	projectName ifNil: [projectName := ''].
	projectTitleMorph contents: (self nameFromFileName: projectName).

	projectTitleMorph contents size > 0
		ifTrue: [s := projectTitleMorph contents, '- Whiskers']
		ifFalse: [s := 'Whiskers ', Version].
	Smalltalk setWindowTitle: s.

	self layoutChanged.
! !
