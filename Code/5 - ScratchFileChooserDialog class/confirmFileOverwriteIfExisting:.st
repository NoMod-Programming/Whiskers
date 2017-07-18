
!ScratchFileChooserDialog class methodsFor: 'utilities' stamp: 'EMP 7/17/2017 23:15'!
confirmFileOverwriteIfExisting: aFilename
	"If the given file exists, ask the user if they want to overwrite it or pick a different file name."

	| response fName |
	fName := aFilename.
	(fName endsWith: '.sb2') ifFalse: [fName := fName, '.sb2'].
	(FileDirectory default fileExists: fName) ifFalse: [^ aFilename].

	response := DialogBoxMorph
		askWithCancel: 'The file name already exists. Overwrite existing file?'.
	response = #cancelled ifTrue: [^ #cancelled].
	response ifTrue: [^ fName] ifFalse: [^ false].
! !
