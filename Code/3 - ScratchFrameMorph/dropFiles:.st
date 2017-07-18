
!ScratchFrameMorph methodsFor: 'event handling' stamp: 'EMP 7/17/2017 23:15'!
dropFiles: evt
"I want to catch dropping of scratch files"
"See processDroppedFiles"
	| fName file m numFiles |
	numFiles := evt contents.
	(m := self viewerPane target) ifNil: [^ self].
	1 to: numFiles do: [:i |
		file := FileStream requestDropStream: 1.
		file close.
		fName := file fullName.
		((fName asLowercase endsWith: '.scratch') | (fName asLowercase endsWith: '.sb') | (fName asLowercase endsWith: '.sb2'))
			ifTrue: [self openScratchDroppedProjectNamed: fName]
			ifFalse: [(fName asLowercase endsWith: '.scrdrvr')
						ifTrue: [self importScratchDriver: fName]
						ifFalse:[
				(fName asLowercase endsWith: '.sprite')
					ifTrue: [self importSpriteOrProject: fName]
					ifFalse: [m importMedia: fName]]]].
! !
