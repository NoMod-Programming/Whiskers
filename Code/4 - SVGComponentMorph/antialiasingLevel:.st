
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 10:39'!
antialiasingLevel: anInteger
	"Set the level of antialiasing to use when drawing"

	^self composedStyle at: 'aa-level' put: anInteger! !
