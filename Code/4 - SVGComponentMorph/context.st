
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/30/2005 20:31'!
context
	"If our owner chain has an SVGCompositeMorph, answer it, otherwise answer the default context."

	^(self ownerThatIsA: SVGCompositeMorph) ifNil: [self defaultContext]! !
