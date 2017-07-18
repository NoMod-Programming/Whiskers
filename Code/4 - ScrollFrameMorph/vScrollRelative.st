
!ScrollFrameMorph methodsFor: 'scrolling' stamp: 'EMP 7/16/2017 21:20'!
vScrollRelative
	"Sent by the vertical scrollbar. Scroll to the given relative postion between 0.0 and 1.0."

	^ self vScrollPixels / (self maxScroll y)! !
