
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 10:37'!
antialiasingLevel
	"Answer the level of antialiasing to use when drawing"

	^self composedStyle at: 'aa-level' ifAbsent: [3]! !
