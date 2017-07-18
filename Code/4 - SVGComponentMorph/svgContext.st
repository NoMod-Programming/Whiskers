
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/30/2005 20:30'!
svgContext
	"If our owner chain has an SVGMorph, answer it, otherwise answer the default context."

	^(self ownerThatIsA: SVGMorph) ifNil: [self defaultContext]! !
