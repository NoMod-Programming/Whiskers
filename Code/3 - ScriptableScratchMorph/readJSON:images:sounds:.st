
!ScriptableScratchMorph methodsFor: 'object i/o' stamp: 'EMP 11/5/2017 20:53'!
readJSON: aDictionary images: images sounds: sounds
	self objName: (aDictionary at: 'objName').
	media := OrderedCollection new.

	(aDictionary at: 'costumes' ifAbsent: [#()]) do: [:costumeDict |
		| scale imageForm rotationCenter image |
		image := images at: ((costumeDict at: 'baseLayerMD5') fileName).
		(image isKindOf: XMLDocument) ifTrue: [
			scale := 1.0 / (costumeDict at: 'bitmapResolution').
			rotationCenter := ((costumeDict at: 'rotationCenterX') * scale) @ ((costumeDict at: 'rotationCenterY') * scale).
			self addMediaItem: (ImageMedia new svgForm: image; rotationCenter: rotationCenter; mediaName: (costumeDict at: 'costumeName')).
		]
		ifFalse: [
			scale := 1.0 / (costumeDict at: 'bitmapResolution').
			imageForm := image magnifyBy: scale.
			rotationCenter := (costumeDict at: 'rotationCenterX') * scale @ ((costumeDict at: 'rotationCenterY') * scale).
			self addMediaItem: (ImageMedia new form: imageForm; rotationCenter: rotationCenter; mediaName: (costumeDict at: 'costumeName'))
		]
	].
	self costumeIndex: (aDictionary at: 'currentCostumeIndex') + 1.

	(aDictionary at: 'sounds' ifAbsent: [#()]) do: [:soundDict |
		| sound |
		sound := sounds at: (soundDict at: 'md5') fileName.
		self addMediaItem: (SoundMedia new sound: sound; mediaName: (soundDict at: 'soundName')).
	].

	blocksBin :=( (aDictionary at: 'scripts' ifAbsent: [#()]) collect: [:scriptTuple |
		Array with: (scriptTuple first @ scriptTuple second) with: scriptTuple third
	]) asArray.

	blocksBin := blocksBin, ((aDictionary at: 'scriptComments' ifAbsent: [#()]) collect: [:commentTuple |
		Array with: (commentTuple first @ commentTuple second) with: {#(scratch2Comment), (commentTuple  copyFrom: 3 to: commentTuple size)}
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
