
!SVGTextMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/31/2005 09:37'!
fontToUse
	"Answer the font to be used at this time.
	Strike fonts should come up with the nearest size to that required,
	TT fonts should be better!!"

	|fontSize textFont trans ptSize|
	trans := self transformFrom: self world.
	fontSize := (self composedStyle at: 'font-size').
	textFont := self composedStyle at: 'font'.
	ptSize := (trans transformDirection: fontSize@0) x rounded - 1 max: 1.
	"textFont := TTCFontSet familyName: textFont familyName pointSize:  ptSize."
	textFont isTTCFont
		ifTrue: [textFont := (TextStyle named: textFont familyName) addNewFontSize: ptSize]
		ifFalse: [textFont := (TextStyle named: textFont familyName) fontOfSize: ptSize].
	^textFont! !
