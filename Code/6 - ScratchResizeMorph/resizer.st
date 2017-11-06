
!ScratchResizeMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 16:47'!
resizer
	^ self submorphs detect: [:m | m isImageMorph]! !
