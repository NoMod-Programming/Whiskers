
!SVGTextMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 09:10'!
createTextFromSVG: anElement
	"Create the text from the svg text.
	Doen't handle tspans yet!!"

	self text: anElement characterData.
	self location: (anElement attributeAt: 'x' ifAbsent: [0]) asSVGNumber@(anElement attributeAt: 'y' ifAbsent: [0]) asSVGNumber
! !
