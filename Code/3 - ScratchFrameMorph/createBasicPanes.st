
!ScratchFrameMorph methodsFor: 'intialization' stamp: 'EMP 7/14/2017 14:18'!
createBasicPanes
	"Create and add my palette (viewer), script editor, stage, and library panes."

	topPane := Morph new color: (Color r: 156 g: 158 b: 162 range: 255).
	viewerPane := ScratchViewerMorph new.	
	scriptsPane := ScratchScriptEditorMorph new viewerPane: viewerPane.
	titlePane := ScratchTitlePaneMorph new.
	workPane := ScratchStageMorph new extent: WorkpaneExtent.
	stageFrame := ScratchWorkpaneMorph new workPane: (workPaneWrapper := self transformerWrappedWorkPane); titlePane: titlePane.
	libraryPane := ScratchLibraryMorph new.

	"make panes sticky so clicking on them doesn't pick up entire frame"
	self
		addMorph: (topPane beSticky);
		addMorph: (scriptsPane beSticky);
		addMorph: (stageFrame beSticky);
		addMorph: (libraryPane beSticky);
		addMorph: (stageFrame beSticky).


	self createReadoutPane.
	workPane comeToFront.
! !