
!ScratchStageMorph methodsFor: 'initialization' stamp: 'EMP 7/18/2017 15:43'!
initialize

	super initialize.
	color := Color white.
	self enableDragNDrop: true.
	objName := 'Stage' localized.
	costume := self defaultImageMedia.
	media := OrderedCollection with: costume with: SoundMedia new.
	runningBlocks := OrderedCollection new.
	inProcessStep := false.
	sensorBoard := SensorBoardMorph new.
	midiPortNum := -1.
	notePlayerDict := Dictionary new.
	sprites := OrderedCollection new.
	showMotorBlocks := false.

	"initialize these redundant values so they are set ok for people loading projects into older systems"
	zoom := 1.0.
	hPan := 0.
	vPan := 0.
	cloneCount := 0.
! !
