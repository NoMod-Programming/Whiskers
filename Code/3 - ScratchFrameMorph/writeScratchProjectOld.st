
!ScratchFrameMorph methodsFor: 'file read/write' stamp: 'EMP 7/17/2017 20:52'!
writeScratchProjectOld
	"Write this Scratch project to the file named projectFile in the project directory. Called by saveScratchProject."

	| oldScriptsTarget oldTab oldViewerCategory oldPosition saveError out viewScale|
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
	workPane allMorphsDo: [:m |
		(m isScriptableScratchMorph) ifTrue: [
			m blocksBin allMorphsDo: [:b |
				b isBlockMorph ifTrue: [b stopProcess]].
			m convertStacksToTuples]].

	saveError := nil.
	[	out := FileStream newFileNamed: (projectDirectory unusedNameStartingWith: 'tmp'). "we shouldn't get any error here since we've carefully found an unused name"
		out
			ifNil: [saveError := 'Folder may be locked or read-only']
			ifNotNil: [
				out binary.
				out nextPutAll: 'ScratchV02' asByteArray.
				self storeProjectInfoOn: out.
				ObjStream new storeObj: workPane on: out.
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
