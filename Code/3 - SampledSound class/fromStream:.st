
!SampledSound class methodsFor: '*Scratch-file reading' stamp: 'EMP 7/16/2017 15:22'!
fromStream: aStream
"Read a sound file  named fileName. The resulting sound may be a SampledSound (mono) or a MixedSound(stereo). We can handle WAV, SND or MP3 files"
	| id snd |
	id := (aStream next: 4) asString.
	aStream position: 0.
	id = 'RIFF' ifTrue:[snd := self fromWaveStream: aStream].
	id = 'FORM' ifTrue:[snd := self fromAIFFStream: aStream].
	snd  ifNotNil:[^snd].
		
	snd ifNil: [self error: 'Unrecognised audio file format'].
	^snd! !
