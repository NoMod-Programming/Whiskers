
!ScratchFrameMorph methodsFor: 'view mode' stamp: 'EMP 7/15/2017 15:38'!
enterQuarterMode
	"Go into quarter stage mode."

	self inQuarterViewMode ifTrue: [
		^ self].

	self setQuarterViewMode;
		setStageSizeHalf.
		
	workPane isInWorld
		ifTrue: [self fixLayout]
		ifFalse: [self exitPresentationMode].

	self updatePanes.! !