
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/28/2005 11:44'!
transformFromSVGElement: anElement
	"Answer a new MatrixTransform2x3 for the transform attribute."

	^self transformFromSVGAttribute: (anElement attributeAt: 'transform')! !
