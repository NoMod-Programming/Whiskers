
!SVGRectMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 09:09'!
createRectangleFromSVG: anElement
	"Create the segments from the rect."

	self
		rectangle:  ((anElement attributeAt: 'x' ifAbsent: [0]) asSVGNumber@(anElement attributeAt: 'y' ifAbsent: [0]) asSVGNumber
					extent: (anElement attributeAt: 'width') asSVGNumber@(anElement attributeAt: 'height') asSVGNumber)! !
