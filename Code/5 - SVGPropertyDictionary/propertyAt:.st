
!SVGPropertyDictionary methodsFor: 'as yet unclassified' stamp: 'gvc 8/8/2005 11:31'!
propertyAt: key
	"Answer the inherited property value for the given key"

	^self findFirstBreadthwise: [:o | o parents] suchThat: [:p | p includesKey: key]! !
