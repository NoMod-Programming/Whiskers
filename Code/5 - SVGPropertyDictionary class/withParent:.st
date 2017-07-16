
!SVGPropertyDictionary class methodsFor: 'as yet unclassified' stamp: 'gvc 8/8/2005 12:25'!
withParent: anObject
	"Answer a new instance of the receiver with the given parent."

	anObject ifNil: [^self withDefaults].
	^self new
		parents: (OrderedCollection with: anObject)! !
