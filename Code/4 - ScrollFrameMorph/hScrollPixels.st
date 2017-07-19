
!ScrollFrameMorph methodsFor: 'scrolling' stamp: 'jm 9/9/2003 10:52'!
hScrollPixels
	"Answer the current horizontal scroll offset in pixels."

	^ (self left + borderWidth) - contents left

! !
