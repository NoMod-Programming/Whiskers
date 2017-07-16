
!ScratchThumbnailMorph methodsFor: 'initialization' stamp: 'EMP 7/13/2017 13:38'!
initialize

	super initialize.
	self image: (Form extent: 46@46 depth: 16).
	image fillColor: Color transparent.
	image border: image boundingBox width: 1.
	self makeReadouts.
	lastUpdateMSecs := -1.
! !
