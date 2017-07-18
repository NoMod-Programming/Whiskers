
!ScratchFrameMorph class methodsFor: 'versioning' stamp: 'EMP 7/16/2017 09:06'!
fileInChangesFromZip: aZipArchive
	"ScratchFrameMorph fileInChangesFromZip: (ZipArchive new readFrom: 'Code.zip')"
	| foldersInOrder |
	(aZipArchive memberNamed: 'preamble.st') ifNotNil: [:preamble |
		preamble contentsAsStream fileIn
	].
	foldersInOrder := aZipArchive members select: [:m | m isDirectory].
	foldersInOrder := foldersInOrder sort: [:a :b | a fileName asNumberNoError < b fileName asNumberNoError].
	foldersInOrder do: [:folder |
		| codeFiles |
		codeFiles := aZipArchive membersMatching: (folder name, '*','.st').
		codeFiles do: [:file |
			file contentsAsStream fileIn
		]
	].
	(aZipArchive memberNamed: 'postscript.st') ifNotNil: [:postscript |
		postscript contentsAsStream fileIn
	].! !
