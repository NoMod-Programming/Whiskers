
!SVGMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/3/2005 08:44'!
createFillsFromSVG: anElement
	"Create the receiver's fills from the given element."

	(self orderedGradients: #linearGradient fromSVG: anElement) do: [:g |
		self createFillFromSVGLinearGradient: g].
	(self orderedGradients: #radialGradient fromSVG: anElement) do: [:g |
		self createFillFromSVGRadialGradient: g]! !
