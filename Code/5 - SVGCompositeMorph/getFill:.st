
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 13:30'!
getFill: name
	"Get the fill with the given name."

	^self fills at: name ifAbsent: [self context getFill: name]! !
