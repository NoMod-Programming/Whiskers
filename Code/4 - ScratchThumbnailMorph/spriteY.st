
!ScratchThumbnailMorph methodsFor: 'accessing' stamp: 'EMP 7/13/2017 13:54'!
spriteY
	target isScratchSpriteMorph ifTrue: [
		^ 'y: ', target ypos truncated asString
	].
	^ ''! !
