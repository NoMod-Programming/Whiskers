
!ScriptableScratchMorph methodsFor: 'private' stamp: 'EMP 7/14/2017 15:05'!
deleteSprite
	"Delete the sprite and all watchers that are associated with it."

	| frame sprites i |
	frame := self ownerScratchFrame. 
	frame ifNil: [^ self delete].

	frame deleteWatchersForSprite: self.

	frame workPane updateSpritesList.
	sprites := frame workPane sprites.
	i := sprites indexOf: self.  "remember my index"
	sprites remove: self ifAbsent: [].

	self delete.

	frame libraryPane layoutChanged.

	"delete my thumbnail, and re-focus on the thumbnail right after me or the stage if there are no sprites"
	i > sprites size ifTrue: [i := i - 1].
	i < 1 
		ifTrue: [frame view: frame workPane tab: 'Scripts' category: 'Motion'] 
		ifFalse: [frame view: (sprites at: i) tab: 'Scripts' category: 'Motion'].	
! !
