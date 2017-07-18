
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 11:09'!
createFromSVG: anElement
	"Create the receiver's state from the svg group."

	super createFromSVG: anElement.
	self processSVGElements: anElement! !
