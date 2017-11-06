
!ScratchFrameMorph methodsFor: 'intialization' stamp: 'EMP 11/4/2017 22:06'!
createBasicPanes
	"Create and add my palette (viewer), script editor, stage, and library panes."

	topPane := Morph new color: (ScratchFrameMorph topPaneColor).
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
