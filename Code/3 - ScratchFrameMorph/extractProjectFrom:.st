
!ScratchFrameMorph methodsFor: 'file read/write' stamp: 'EMP 7/16/2017 12:55'!
extractProjectFrom: aByteArray
	"Answer a Scratch project (i.e. a ScratchStageMorph possibly containing sprites) from the given ByteArray. Answer nil if the project cannot be unpacked."

	| s version proj |
	s := ReadStream on: aByteArray.
	(ZipArchive isZipArchive: s)
		ifTrue: [version := 3.
				proj := self decodeFromZipFile: s]
		ifFalse: [s position: 0.
				version := ObjStream scratchFileVersionFrom: (s next: 10) asString.
				version = 0 ifTrue: [
					s position: 0.
					proj := ObjStream new readObjFrom: s showProgress: true].
				(version = 1) | (version = 2) ifTrue: [
					s skip: s uint32.  "skip header"
					proj := ObjStream new readObjFrom: s showProgress: true
				]
	].

	proj class = ScratchStageMorph ifFalse: [
		version > 2
			ifTrue: [self error: 'Project created by a later version of Scratch']
			ifFalse: [self error: 'Problem reading project.'].
		^ nil].

	ScriptableScratchMorph buildBlockSpecDictionary.
	proj allMorphsDo: [:m |
		(m isScriptableScratchMorph) ifTrue: [  "covert to new blocks"
			m convertStacksToTuples.
			m convertTuplesToStacks]].

	^ proj! !
