
!SVGRectangularMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 13:50'!
userSpaceBoundingBoxWithRespectTo: aComposite
	"Answer the bounding box of the receiver with respect to the transforms
	intervening between the receiver and aComposite."

	^self rectangle boundsWithTransform: (self transformFrom: aComposite)! !
