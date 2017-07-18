
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 12:57'!
createFromSVG: anElement
	"Create a path from the svg path."

	super createFromSVG: anElement.
	self createSegmentsFromSVG: anElement! !
