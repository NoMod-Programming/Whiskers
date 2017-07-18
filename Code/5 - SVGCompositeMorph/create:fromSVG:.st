
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/31/2005 16:37'!
create: anSVGComponentMorphClass fromSVG: anElement
	"Create a component from the svg."

	|comp|
	comp := anSVGComponentMorphClass new.
	comp extent: self extent.
	comp transform: MatrixTransform2x3 identity.
	self addMorph: comp.
	^comp createFromSVG: anElement
	

	! !
