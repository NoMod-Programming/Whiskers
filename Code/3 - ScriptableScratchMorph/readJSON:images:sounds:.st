
!ScriptableScratchMorph methodsFor: 'object i/o' stamp: 'EMP 7/16/2017 15:33'!
readJSON: aDictionary images: images sounds: sounds
	self objName: (aDictionary at: 'objName').
	media := OrderedCollection new.

	(aDictionary at: 'costumes' ifAbsent: [#()]) do: [:costumeDict |
		| scale imageForm rotationCenter image |
		image := images at: (costumeDict at: 'baseLayerID').
		(image isKindOf: XMLDocument) ifTrue: [
			scale := 1.0 / (costumeDict at: 'bitmapResolution').
			rotationCenter := ((costumeDict at: 'rotationCenterX') * scale) @ ((costumeDict at: 'rotationCenterY') * scale).
			self addMediaItem: (ImageMedia new svgForm: (images at: (costumeDict at: 'baseLayerID')); rotationCenter: rotationCenter; mediaName: (costumeDict at: 'costumeName')).
		]
		ifFalse: [
			scale := 1.0 / (costumeDict at: 'bitmapResolution').
			imageForm := (images at: (costumeDict at: 'baseLayerID')) magnifyBy: scale.
			rotationCenter := (costumeDict at: 'rotationCenterX') * scale @ ((costumeDict at: 'rotationCenterY') * scale).
			self addMediaItem: (ImageMedia new form: imageForm; rotationCenter: rotationCenter; mediaName: (costumeDict at: 'costumeName'))
		]
	].
	self costumeIndex: (aDictionary at: 'currentCostumeIndex') + 1.

	(aDictionary at: 'sounds' ifAbsent: [#()]) do: [:soundDict |
		| sound |
		sound := sounds at: (soundDict at: 'soundID').
		self addMediaItem: (SoundMedia new sound: sound; mediaName: (soundDict at: 'soundName')).
	].

	blocksBin :=( (aDictionary at: 'scripts' ifAbsent: [#()]) collect: [:scriptTuple |
		Array with: (scriptTuple first @ scriptTuple second) with: scriptTuple third
	]) asArray.

	(aDictionary at: 'variables' ifAbsent: [#()]) do: [:varDict |
		self addVariable: (varDict at: 'name') value: (varDict at: 'value')
	].

	(aDictionary at: 'lists' ifAbsent: [#()]) do: [:listDict |
		lists
			at: (listDict at: 'listName') 
			put: (ScratchListMorph new
						listName: (listDict at: 'listName')
						target: self;
						newContents: (listDict at: 'contents');
						position: (listDict at: 'x') @ (listDict at: 'y');
						extent: (listDict at: 'width') @ (listDict at: 'height'))
	].! !
