
!ScratchFrameMorph methodsFor: 'file read/write' stamp: 'EMP 7/17/2017 23:14'!
writeScratchProject
	"Write this Scratch project to the zip file named projectFile in the project directory. Called by saveScratchProject."

	| oldScriptsTarget oldTab oldViewerCategory oldPosition saveError out viewScale images jsonDictionary outArchive sounds |
	self stopAll.
	self world ifNotNil: [self world activeHand newKeyboardFocus: nil].  "terminates active editor"

	"share duplicate sounds and images"
	self canonicalizeSoundsBits: nil saveOriginal: false.
	self canonicalizeImagesQuality: nil saveOriginal: false.

	oldScriptsTarget := scriptsPane target.
	oldTab := scriptsPane tabPane currentTab.
	oldViewerCategory := viewerPane currentCategory.
	scriptsPane target: nil.

	workPane updateSpritesList.
	oldPosition := workPaneWrapper position.
	viewScale := workPaneWrapper scaleFactor.
	workPane delete.
	self updatePenPositions.
	workPaneWrapper delete.
	workPaneWrapper := nil.

	ScriptableScratchMorph buildBlockSpecDictionary.

	outArchive := ZipArchive new.

	jsonDictionary := Dictionary new.
	images := OrderedCollection new.
	sounds := OrderedCollection new.

	workPane
		writeJSON: jsonDictionary
		images: images
		sounds: sounds.

	outArchive
		addString: (String streamContents: [:strm |
			jsonDictionary jsonWriteOn: strm])
		as: 'project.json'.

	images withIndexDo: [:img :i |
		img isForm ifTrue: [
			outArchive addString: (ByteArray streamContents: [:strm |
			PNGReadWriter putForm: img onStream: strm]) as: ((i - 1) asString,'.png')
		].
		img isScratchMedia ifTrue: [
			img svgForm
				ifNil: [outArchive addString: (ByteArray streamContents: [:strm |
						PNGReadWriter putForm: (img compositeFormForScale: 1.0) onStream: strm]) as: ((i - 1) asString,'.png')]
				ifNotNil: [outArchive addString: (ByteArray streamContents: [:strm |
						img svgForm printXMLOn: (XMLWriter on: strm)]) as: ((i - 1) asString,'.svg')]
		].
	].
	sounds withIndexDo: [:snd :i |
		outArchive
			addString: ((ByteArray streamContents: [:strm |
				snd sound storeWAVSamplesOn: strm]))
			as: ((i - 1) asString,'.wav')
	].
	saveError := nil.
	[	out := FileStream newFileNamed: (projectDirectory unusedNameStartingWith: 'tmp'). "we shouldn't get any error here since we've carefully found an unused name"
		out
			ifNil: [saveError := 'Folder may be locked or read-only']
			ifNotNil: [
				outArchive writeTo: out.
				out flush; sync; close].
	] ifError: [:err :rcvr |
		out ifNotNil: [
			[	out close.
				projectDirectory deleteFileNamed: out localName.
			] ifError: []].  "clean up, ignoring any errors"
		saveError := err].

	workPane allMorphsDo: [:m |
		(m isScriptableScratchMorph) ifTrue: [
			m convertTuplesToStacks]].

	workPaneWrapper := self transformerWrappedWorkPane.
	self addMorph: (workPaneWrapper position: oldPosition; scale: viewScale).
	workPaneWrapper beSticky.
	oldScriptsTarget ifNil: [oldScriptsTarget := workPane].
	oldScriptsTarget viewBlocksAndScripts.
	scriptsPane tabPane currentTab: oldTab.
	viewerPane currentCategory: oldViewerCategory.
	self updatePenPositions.

	saveError
		ifNil: [
			justSaved := true.
			self updateProjectName.
			projectDirectory deleteFileNamed: projectName.
			[projectDirectory rename: out localName toBe: projectName]
				ifError: [^ self inform: 'Save failed' withDetails: 'Is the folder read-only?' localized].
			projectDirectory setMacFileNamed: projectName type: 'STsb' creator: 'MITS']
		ifNotNil: [
			projectName := ''.
			self inform: 'Save failed' withDetails: saveError].
! !
