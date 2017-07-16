
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 10:42'!
composedStyle
	"Answer the composed style dictionary"

	self cachedComposedStyle isNil
		ifTrue: [self
				cachedComposedStyle: (self context composedStyle copy
					addAll: self style;
					yourself)].
	^self cachedComposedStyle! !
