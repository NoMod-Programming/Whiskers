
!ScratchSpriteMorph methodsFor: 'object i/o' stamp: 'EMP 7/17/2017 20:46'!
writeJSON: aDictionary images: images sounds: sounds
	| stage |
	super
		writeJSON: aDictionary
		images: images
		sounds: sounds.
	aDictionary at: 'scratchX' put: self xpos.
	aDictionary at: 'scratchY' put: self ypos.
	aDictionary at: 'scale' put: scalePoint x.
	aDictionary at: 'direction' put: self heading.
	aDictionary at: 'rotationStyle' put: self rotationStyle.
	aDictionary at: 'isDraggable' put: self draggable.
	stage := self ownerThatIsA: ScratchStageMorph.
	aDictionary at: 'indexInLibrary' put: (stage submorphs indexOf: self) - 1.
	aDictionary at: 'visible' put: self visible.! !
