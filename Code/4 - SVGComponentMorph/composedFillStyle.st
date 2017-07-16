
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/31/2005 13:12'!
composedFillStyle
	"Answer the composed fill style."

	|fill|
	fill := self composedStyle at: 'fill'.
	fill isGradientFill
		ifFalse: [^fill].
	fill := fill mappedTo: self.
	^fill! !
