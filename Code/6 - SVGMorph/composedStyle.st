
!SVGMorph methodsFor: 'accessing' stamp: 'gvc 7/29/2005 21:22'!
composedStyle
	"Answer the composed style dicrionary"

	self cachedComposedStyle isNil
		ifTrue: [self cachedComposedStyle: self style].
	^self cachedComposedStyle! !
