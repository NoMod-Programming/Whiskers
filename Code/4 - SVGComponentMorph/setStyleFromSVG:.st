
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/14/2005 11:00'!
setStyleFromSVG: anElement
	"Set the dictionary of the style parameters from the element."

	self style
		addAll:  (self renderer styleIn: self fromSVGStyle: (self styleFromSVG: anElement))! !
