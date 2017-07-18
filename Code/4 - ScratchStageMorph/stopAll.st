
!ScratchStageMorph methodsFor: 'scratch processes/events' stamp: 'EMP 7/16/2017 20:28'!
stopAll
	"Stop all processes and make sure I am stepping."

	World hands do: [:h | h newKeyboardFocus: nil].
	Sensor clearKeystate.
	SoundPlayer stopPlayingAll.
	self class stopSoundRecorder.
	self stopAllProcesses.
	self stopAsks.
	WhenGreaterThanHatBlockMorph allInstancesDo: [:m | m reset].
	self deleteAllClones.
	self midiAllNotesOff.
	WeDoPlugin resetWeDo.
	self stopPlaying.
	self allMorphsDo: [:m |
		(m isScriptableScratchMorph) ifTrue: [m stopPlaying]]
! !
