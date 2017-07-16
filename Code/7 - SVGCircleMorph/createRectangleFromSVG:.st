
!SVGCircleMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 08:34'!
createRectangleFromSVG: anElement
	"Create the bounding rectangle from the svg circle."

	self
		rectangle: (Rectangle
			center: (anElement attributeAt: 'cx' ifAbsent: [0]) asSVGNumber@(anElement attributeAt: 'cy' ifAbsent: [0]) asSVGNumber
			extent: (anElement attributeAt: 'r' ifAbsent: [0]) asSVGNumber  asPoint * 2)! !
