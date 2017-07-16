
!ScratchFrameMorph methodsFor: 'private' stamp: 'EMP 7/14/2017 12:58'!
updatePanes
"This rebuilds all the UI panes after changing the view mode or language - almost complete re-layout"
	| p |
	menuPanel delete.
	self createMenuPanel.

	toolbarPanel delete.
	self createToolbar.

	stageButtonsPanel delete.
	self createStageButtonsPanel.
	titlePane addMorph: stageButtonsPanel.

	scriptsPane updatePanes.

	readoutPane delete.
	self createReadoutPane.

	workPane sensorBoard owner
		ifNil: [p := nil]
		ifNotNil: [p := workPane sensorBoard position].

	workPane sensorBoard addReadouts.
	p ifNotNil:[
		self showSensorBoard.
		workPane sensorBoard position: p].

	libraryPane clearLibrary.

	self scratchWatchers do: [:w | w languageChanged].
	self listWatchers do: [:w | w fixLayoutForNewLanguage].

	World startSteppingSubmorphsOf: self.

	self layoutChanged.
	scriptsPane layoutChanged.
! !
