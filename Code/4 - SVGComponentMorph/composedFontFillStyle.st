
!SVGComponentMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/8/2005 13:25'!
composedFontFillStyle
	"Answer the composed font fill style."

	|fill|
	fill := self composedStyle at: 'font-fill'ifAbsent: [self composedFillStyle].
	^fill! !
