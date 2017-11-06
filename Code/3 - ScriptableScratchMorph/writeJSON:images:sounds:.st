
!ScriptableScratchMorph methodsFor: 'object i/o' stamp: 'EMP 11/3/2017 22:37'!
writeJSON: aDictionary images: images sounds: sounds
	| varDict listDict soundDict imagesDict allObjects stage |
	stage :=  self ownerOrYourselfThatIsA: ScratchStageMorph.
	aDictionary at: 'objName' put: objName.
	aDictionary at: 'variables' put: (varDict := OrderedCollection new).
	vars keysAndValuesDo: [:key :value |
		varDict add: (Dictionary newFrom: {
			'name' -> key.
			'value' -> value.
			'isPersistent' -> false
		})].
	aDictionary at: 'lists' put: (listDict := OrderedCollection new).
	lists keysAndValuesDo: [:key :list |
		listDict add: (Dictionary newFrom: {
			'listName' -> list listName.
			'contents' -> list listContents.
			'isPersistent' -> false.
			'x' -> (list left + 240).
			'y' -> (list top + 180).
			'width' -> list width.
			'height' -> list height.
			'visible' -> (stage submorphs includes: list).
		})].
	allObjects := self stacksAsTuples.
	aDictionary at: 'scripts' put: allObjects first.
	aDictionary at: 'scriptComments' put: allObjects second.
	aDictionary at: 'sounds' put: (soundDict := OrderedCollection new).
	aDictionary at: 'costumes' put: (imagesDict := OrderedCollection new).
	media do: [:el |
		el isSound ifTrue: [
			soundDict add: (Dictionary newFrom: {
				'soundName' -> el mediaName.
				'soundID' -> (sounds size).
				'md5' -> el md5.
				'sampleCount' -> el sound samples size.
				'rate' -> el sound samplingRate.
				'format' -> 'adpcm'.
			}).
			sounds add: el]
		ifFalse: [
			imagesDict add: (Dictionary newFrom: {
				'costumeName' -> el mediaName.
				'baseLayerID' -> (images size).
				'baseLayerMD5' -> el md5.
				'bitmapResolution' -> 1.
				'rotationCenterX' -> el rotationCenter x.
				'rotationCenterY' -> el rotationCenter y.
			}).
			images add: el]].
	aDictionary at: 'currentCostumeIndex' put: self costumeIndex - 1.! !
