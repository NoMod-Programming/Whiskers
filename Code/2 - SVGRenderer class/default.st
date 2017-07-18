
!SVGRenderer class methodsFor: 'as yet unclassified' stamp: 'gvc 8/4/2005 10:03'!
default
	"Answer the default renderer."

	^DefaultRenderer ifNil: [^DefaultRenderer := SVGBalloonRenderer new]! !
