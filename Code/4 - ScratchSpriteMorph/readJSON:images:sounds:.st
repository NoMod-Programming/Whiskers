
!ScratchSpriteMorph methodsFor: 'object i/o' stamp: 'EMP 7/16/2017 15:02'!
readJSON: aDictionary images: images sounds: sounds
	super
		readJSON: aDictionary
		images: images
		sounds: sounds.
	self scalePoint: (aDictionary at: 'scale') @ (aDictionary at: 'scale');
		heading: (aDictionary at: 'direction');
		rotationStyle: (aDictionary at: 'rotationStyle');
		position: (aDictionary at: 'scratchX') + 240 @ (180 - (aDictionary at: 'scratchY')) - offsetWhenRotated - costume rotationCenter;
		draggable: (aDictionary at: 'isDraggable');
		visible: (aDictionary at: 'visible').! !
