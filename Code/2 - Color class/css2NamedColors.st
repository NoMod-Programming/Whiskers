
!Color class methodsFor: '*SVG-Morphic' stamp: 'gvc 8/1/2005 09:40'!
css2NamedColors
	"Answer a dictionary of CSS2 compliant color names to Color objects."

	^self
		environment at: #CSS2NamedColors
		ifAbsentPut: [self css2NamedColors1
					addAll: self css2NamedColors2;
					yourself]! !
