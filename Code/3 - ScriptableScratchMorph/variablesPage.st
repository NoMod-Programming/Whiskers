
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 11/5/2017 17:05'!
variablesPage
	"Answer a morph containing my variables."

	| page addButton hasVars stage x y maxX |
	page := ScratchBlockPaletteMorph new
		color: ScratchFrameMorph palettePaneColor;
		borderWidth: 0.

	addButton := ScratchFrameMorph
		buttonLabel: 'Make a variable' localized
		selector: #addGlobalVariable.
	self isScratchSpriteMorph ifTrue: [addButton actionSelector: #addVariable].

	x := 13.
	page addMorph: (addButton target: self; position: x@7).
	y := addButton bottom + 3.

	hasVars := self hasVariables.
	(stage := self ownerOrYourselfThatIsA: ScratchStageMorph) ifNotNil: [
		stage hasVariables ifTrue: [hasVars := true]].

	hasVars ifTrue: [
		y := self addVariableReportersTo: page x: x y: y.
		y := y + 12.
		y := self addGenericVariableBlocksTo: page x: x y: y].

	self addGenericListBlocksTo: page y: y.
	page updateWatcherButtonsForFrame: self ownerScratchFrame.
	maxX := page submorphs inject: 0 into: [:t :m | t max: m right].
	page extent: (maxX + 10) @ y.
	^ page
! !
