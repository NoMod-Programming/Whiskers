
!SVGPropertyDictionary class methodsFor: 'as yet unclassified' stamp: 'gvc 8/8/2005 12:25'!
withParents: aCollection
	"Answer a new instance of the receiver with the given parents."

	aCollection isEmpty ifTrue: [^self withDefaults].
	^self new
		parents: aCollection asOrderedCollection copy! !
