
!SVGGradientFillStyle methodsFor: 'accessing' stamp: 'gvc 10/31/2005 13:22'!
mappedTo: anSVGComponentMorph
	"Answer a copy of the receiver with the appropriate origin and direction."

	self mapsToObjectBounds
		ifTrue: [^self mappedToBounds: anSVGComponentMorph globalBoundingBox].
	^self! !
