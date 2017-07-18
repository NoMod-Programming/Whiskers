
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/30/2005 22:24'!
hasFill
	"Answer whether there is a fill for the receiver."

	^self composedFillStyle isTransparent not! !
