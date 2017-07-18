
!ScratchStageMorph methodsFor: 'object i/o' stamp: 'EMP 7/17/2017 21:02'!
writeJSON: aDictionary images: images sounds: sounds
	| childArray |
	self createOrResizeTrailsForm.
	super
		writeJSON: aDictionary
		images: images
		sounds: sounds.
	aDictionary at: 'penLayerID' put: (images size).
	images add: penTrailsForm.

	aDictionary at: 'penLayerMD5' put: -1.

	aDictionary at: 'tempoBPM' put: tempoBPM.

	aDictionary at: 'videoAlpha' put: 100.
	aDictionary at: 'info' put: (Dictionary new).

	aDictionary at: 'children' put: (childArray := OrderedCollection new).

	self submorphs do: [:aMorph |
		| childDict |
		childDict := Dictionary new.
		aMorph
			writeJSON: childDict
			images: images
			sounds: sounds.
		childArray add: childDict].! !
