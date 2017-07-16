
!ScratchScriptEditorMorph methodsFor: 'initialization' stamp: 'EMP 7/14/2017 16:08'!
createTabPane

	"create tab pane"
	tabPaneMorph := ScratchTabPaneMorph new.
	tabPaneMorph
		borderWidth: 0;
		color: Color transparent;
		targetPane: self.


	"add the tabs"
	#(Scripts Costumes Sounds) do: [:spec |
		tabPaneMorph createTab: spec asString].

	"set current tab and add to frame"
	tabPaneMorph currentTab: 'Scripts'.
	self addMorph: tabPaneMorph.
! !
