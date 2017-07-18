
!ScratchFrameMorph methodsFor: 'file read/write' stamp: 'EMP 7/17/2017 20:52'!
writeScratchProjectObsolete
	"Obsolete!! Uses old format!! Write this Scratch project to the file named projectFile in the project directory. Called by saveScratchProject."

	| oldScriptsTarget oldTab oldViewerCategory oldPosition saveError out |
	self world ifNotNil: [self world activeHand newKeyboardFocus: nil].  "terminates active editor"
	self stopAll.

	(projectDirectory isString) ifTrue: [
		projectDirectory := FileDirectory on: projectDirectory].
	((FileDirectory default directoryExists: projectDirectory pathName) or: 
		[FileDirectory root directoryNames includes: projectDirectory pathName]) ifFalse: [
			projectDirectory := FileDirectory default].

	oldScriptsTarget := scriptsPane target.
	oldTab := scriptsPane tabPane currentTab.
	oldViewerCategory := viewerPane currentCategory.
	scriptsPane target: nil.

	oldPosition := workPane position.
	workPane delete; position: 0@0.

	ScriptableScratchMorph buildBlockSpecDictionary.
	workPane allMorphsDo: [:m |
		(m isScriptableScratchMorph) ifTrue: [
			m blocksBin allMorphsDo: [:b |
				(b isBlockMorph) ifTrue: [b stop]].
			"xxx m convertStacksToTuples xxx"]].

	saveError := nil.
	[	out := (FileStream newFileNamed: (projectDirectory unusedNameStartingWith: 'tmp')) binary.
		ObjStream new storeObj: workPane on: out showProgress: true.
		out close.
	] ifError: [:err :rcvr | saveError := err].

	workPane allMorphsDo: [:m |
		(m isScriptableScratchMorph) ifTrue: [
			m convertTuplesToStacks]].

	workPane position: oldPosition.
	self addMorph: workPane.
	oldScriptsTarget ifNil: [oldScriptsTarget := workPane].
	oldScriptsTarget viewBlocksAndScripts.
	scriptsPane tabPane currentTab: oldTab.
	viewerPane currentCategory: oldViewerCategory.
	self updateProjectName.

	saveError
		ifNil: [
			projectDirectory deleteFileNamed: projectName.
			projectDirectory rename: out localName toBe: projectName.
			projectDirectory setMacFileNamed: projectName type: 'STsb' creator: 'MITS']
		ifNotNil: [
			out close.
			projectDirectory deleteFileNamed: out localName.
			self inform: 'Save failed' withDetails: saveError].
! !
