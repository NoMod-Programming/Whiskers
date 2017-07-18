
!TTCFont methodsFor: '*SVG-morphic' stamp: 'gvc 7/31/2005 10:00'!
derivativeFont: aTTCFont
	"Modified since poping up an inform is really annoying when adding font sizes programatically!!"

	| index |
	index := self indexOfSubfamilyName: aTTCFont subfamilyName.
	index < 1 ifTrue: [^nil].

	self derivativeFont: aTTCFont at: index.

	self addLined: aTTCFont.
! !
