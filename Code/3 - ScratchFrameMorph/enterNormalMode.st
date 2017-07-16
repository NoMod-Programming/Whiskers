
!ScratchFrameMorph methodsFor: 'view mode' stamp: 'EMP 7/14/2017 12:58'!
enterNormalMode
	"Go into normal (full-stage) mode."

	(self inNormalViewMode) ifTrue: [
		^ self].

	self setNormalViewMode;
		setStageSizeNormal.
		
	workPane isInWorld
		ifTrue: [self fixLayout]
		ifFalse: [self exitPresentationMode].

	self updatePanes.! !
