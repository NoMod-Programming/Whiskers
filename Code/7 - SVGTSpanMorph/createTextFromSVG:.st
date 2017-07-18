
!SVGTSpanMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 09:10'!
createTextFromSVG: anElement
	"Create the text from the svg text."

	super createTextFromSVG: anElement.
	self location:
		(anElement attributeAt: 'x' ifAbsent: [self owner location x]) asSVGNumber @
		(anElement attributeAt: 'y' ifAbsent: [self owner location y]) asSVGNumber
! !
