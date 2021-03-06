
!ScratchLibraryMorph methodsFor: 'private' stamp: 'EMP 7/14/2017 09:09'!
addThumbnailFor: aMorph
	"Add a thumbnail for the given morph."

	| newThumbnail |
	newThumbnail := LibraryItemMorph new.
	newThumbnail extent: itemExtent thumbWidth: thumbWidth - 13.
	newThumbnail  target: aMorph.
	(newThumbnail target isKindOf: ScratchStageMorph)
		ifTrue: [stagePane addMorph: newThumbnail]
		ifFalse: [scrollPane contents addMorphBack: newThumbnail].
	newThumbnail step.
! !
