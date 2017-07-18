
!ScratchSpriteMorph methodsFor: 'dropping/grabbing' stamp: 'EMP 7/16/2017 21:23'!
justDroppedIntoScratchStage: stageMorph event: anEvent
	"I'm being dropped into a ScratchStageMorph"

	stageMorph addMorph: self.
	self positionTalkBubble.
	stageMorph isInWorld ifTrue: [stageMorph world startSteppingSubmorphsOf: self].
	self penDown ifTrue: [stageMorph penUpOrDownChangeFor: self].
	stageMorph changed.
	self ownerScratchFrame viewerPane refresh.

! !
