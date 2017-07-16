
!ScratchScriptEditorMorph methodsFor: 'layout' stamp: 'EMP 7/13/2017 12:53'!
updatePanes
"my subpanes need updating for a new layout or language setting"
	tabPaneMorph delete.
	self createTabPane.! !
