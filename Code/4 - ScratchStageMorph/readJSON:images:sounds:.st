
!ScratchStageMorph methodsFor: 'object i/o' stamp: 'EMP 7/17/2017 17:11'!
readJSON: aDictionary images: images sounds: sounds
	| listWatchers spritesByName spritesInOrder variableWatchers |
	super
		readJSON: aDictionary
		images: images
		sounds: sounds.

	listWatchers := OrderedCollection new.
	variableWatchers := OrderedCollection new.
	spritesByName := Dictionary new.
	spritesInOrder := Dictionary new.

	aDictionary at: 'penLayerID' ifPresent: [:penLayerID |
	penTrailsForm := images at: penLayerID.
	].

	 (aDictionary at: 'lists' ifAbsent: [#()]) do: [:listDict |
		(listDict at: 'visible') ifTrue: [listWatchers addLast: (lists at: (listDict at: 'listName'))]
	].

	(aDictionary at: 'children' ifAbsent: [#()]) do: [:child |
		child
			at: 'objName'
			ifPresent: [:ignore |
				| sprite |
				sprite := ScratchSpriteMorph new
											readJSON: child
											images: images
											sounds: sounds.
				self addMorph: sprite.
				spritesInOrder at: (child at: 'indexInLibrary') put: sprite.
				spritesByName at: (child at: 'objName') put: sprite.
				(child at: 'lists' ifAbsent: [#()]) do: [:listDict |
					(listDict at: 'visible') ifTrue: [listWatchers addLast: (sprite lists at: (listDict at: 'listName'))]
				]
			]
			ifAbsent: [
				child at: 'sliderMin' ifPresent: [:ignore | (child at: 'visible') ifTrue: [variableWatchers addLast: child]]
			]
	].
	spritesInOrder do: [:sprite | sprites addLast: sprite].
	spritesByName at: 'Stage' put: self.
	variableWatchers do: [:watcher | self addMorph: (WatcherMorph new readJSON: watcher spritesByName: spritesByName)].
	listWatchers do: [:watcher | self addMorph: (watcher)]! !
