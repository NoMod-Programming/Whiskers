
!ScriptableScratchMorph class methodsFor: 'other' stamp: 'EMP 7/18/2017 15:24'!
soundRecorder
	"Return the shared Scratch SoundRecorder. Create and start it, if necessary."

	[Recorder ifNil: [
		Recorder := SoundRecorder new.
		Recorder startRecording].
	Recorder isActive ifFalse: [Recorder startRecording]] on: Warning do: [:err | ].
	^ Recorder
! !
