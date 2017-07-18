
!ScratchListMorph methodsFor: 'import/export' stamp: 'EMP 7/17/2017 23:34'!
writeJSON: aDictionary images: images sounds: sounds
	| stage |
	aDictionary at: 'listName' put: listName.
	aDictionary at: 'contents' put: self listContents.
	aDictionary at: 'isPersistent' put: false.
	stage := self ownerThatIsA: ScratchStageMorph.
	aDictionary at: 'x' put: self left + 240.
	aDictionary at: 'y' put: self top + 180.
	aDictionary at: 'width' put: self width.
	aDictionary at: 'height' put: self height.
	aDictionary at: 'visible' put: true.! !
