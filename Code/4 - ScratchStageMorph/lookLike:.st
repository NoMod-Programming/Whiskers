
!ScratchStageMorph methodsFor: 'looks ops' stamp: 'EMP 7/16/2017 19:59'!
lookLike: aBackground
	super lookLike: aBackground.
	self broadcastEvent: (ScratchBackdropChangeEvent for: (self costumeNameFromNumber: (self costumeIndex)))! !
