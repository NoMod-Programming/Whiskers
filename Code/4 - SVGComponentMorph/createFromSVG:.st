
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/12/2005 11:12'!
createFromSVG: anElement
	"Create a path from the svg path."

	self
		id: (anElement attributeAt: 'id');
		transform: (self transformFromSVGElement: anElement);
		setStyleFromSVG: anElement! !
