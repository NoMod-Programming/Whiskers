
!ScrollFrameMorph methodsFor: 'scrolling' stamp: 'jm 9/9/2003 10:52'!
vScrollPixels
	"Answer the current vertical scroll offset in pixels."

	^ (self top + borderWidth) - contents top

! !
