
!SVGTextMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 11:15'!
processSVGElements: anElement
	"Process the elements of the given text type element."

	anElement tagsNamed: #tspan do: [:e |
		self createTSpanFromSVGTSpan: e]! !
