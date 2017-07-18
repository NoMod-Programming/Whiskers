
!SVGMorph class methodsFor: 'as yet unclassified' stamp: 'gvc 10/17/2005 17:40'!
fromFile: filename
	"Open an SVGMorph from the given file."

	| s answer|
	s := FileStream oldFileNamed: filename.
	s ifNil: [^nil].
	[answer _ self fromFileStream: s]
		ensure: [s close].
	^answer! !
