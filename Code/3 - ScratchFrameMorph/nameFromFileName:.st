
!ScratchFrameMorph methodsFor: 'file read/write' stamp: 'EMP 7/16/2017 12:56'!
nameFromFileName: fileName
	"Return the given Scratch file name without the trailing .sb or .scratch extension, if it has one. Ensure the the result is UTF8."

	| s |
	<pragma: #i18nIssue>
	s := fileName.
	(s asLowercase endsWith: '.scratch') ifTrue: [s := s copyFrom: 1 to: s size - 8].
	(s asLowercase endsWith: '.sb') ifTrue: [s := s copyFrom: 1 to: s size - 3].
	(s asLowercase endsWith: '.sb2') ifTrue: [s := s copyFrom: 1 to: s size - 4].

	^ s

! !
