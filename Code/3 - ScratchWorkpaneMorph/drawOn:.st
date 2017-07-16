
!ScratchWorkpaneMorph methodsFor: 'drawing' stamp: 'EMP 7/14/2017 13:46'!
drawOn: aCanvas
	aCanvas fillRectangle: bounds color: color.
	aCanvas frameRectangle: (workPane bounds expandBy: 1) width: 1 color: ScratchFrameMorph borderColor! !
