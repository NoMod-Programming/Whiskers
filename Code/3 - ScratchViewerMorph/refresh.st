
!ScratchViewerMorph methodsFor: 'accessing' stamp: 'EMP 7/16/2017 21:22'!
refresh
	"Refresh the palette for the current category."
	| oldPosition |
	
	oldPosition := pageViewer vScrollPixels.
	self updateContents.
	pageViewer vScrollPixels: oldPosition! !
