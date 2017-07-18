
!SVGRectangularMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 13:49'!
createFromSVG: anElement
	"Create a rectangle from the svg rect."

	super createFromSVG: anElement.
	self createRectangleFromSVG: anElement! !
