
!ScratchThumbnailMorph methodsFor: 'drawing' stamp: 'EMP 7/13/2017 13:29'!
drawOn: aCanvas
		^ aCanvas paintImage: image at: self innerBounds origin sourceRect: image boundingBox alpha: 0.5.! !