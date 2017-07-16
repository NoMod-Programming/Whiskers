
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/30/2005 20:33'!
globalBoundingBox
	"Answer the bounding box of the receiver with resepect to the top level."

	^self userSpaceBoundingBoxWithRespectTo: self svgContext! !
