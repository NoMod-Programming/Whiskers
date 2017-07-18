
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 10:45'!
antialiasingLevel: anInteger
	"Set the level of antialiasing to use when drawing"

	super antialiasingLevel: anInteger.
	self submorphsDo: [:m |
		m antialiasingLevel: anInteger]! !
