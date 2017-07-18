
!ScratchListMorph methodsFor: 'object i/o' stamp: 'EMP 7/17/2017 19:23'!
asJSONforStage: aStageMorph
	| listDict |
	listDict := Dictionary new.
	listDict at: 'listName' put: listName.
	listDict at: 'contents' put: self listContents.
	listDict at: 'x' put: self x - aStageMorph x.
	listDict at: 'y' put: self y - aStageMorph y.
	listDict at: 'width' put: self width.
	listDict at: 'height' put: self height.
	listDict at: 'isPersistent' put: false.! !
