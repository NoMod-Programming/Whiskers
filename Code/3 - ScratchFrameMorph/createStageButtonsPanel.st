
!ScratchFrameMorph methodsFor: 'intialization' stamp: 'EMP 7/17/2017 15:47'!
createStageButtonsPanel
	"Create and add a panel containing the project title, green flag, and stop buttons."

	| buttonSpecs bName button bspec |
	"create panel"
	stageButtonsPanel := AlignmentMorph new
		color: Color transparent;
		wrapCentering: #center;
		height: 20.

	bspec := #(fullScreen	enterPresentationMode	'Switch to presentation mode').
	bName := bspec first.
	button := ToggleButton new
		onForm: (ScratchFrameMorph skinAt: bName, 'Off')
		offForm: (ScratchFrameMorph skinAt: bName, 'Off')
		overForm: (ScratchFrameMorph skinAt: bName, 'Off').
	button
		target: self;
		actionSelector: (bspec at: 2);
		alphaOn: true;
		setBalloonText: (bspec at: 3) localized maxLineLength: 100.
	stageButtonsPanel
		addMorphBack: button;
		addMorphBack: (AlignmentMorph newSpacer: Color transparent).

	projectTitleMorph := StringMorph new
		contents: '';
		font: (ScratchFrameMorph getFont: #FrameMorphProjectTitle).
	projectTitleMorph lock.
	stageButtonsPanel
		addMorphBack: projectTitleMorph;
		addMorphBack: (AlignmentMorph newSpacer: Color transparent).

	"buttonSpecs defines the toolbar buttons; first is icon name, second is selector"
	buttonSpecs := #(
		"name	selector		tool tip"
		(go		shoutGo	'Start green flag scripts')
		(stop	stopAll		'Stop everything')).

	buttonSpecs do: [:spec |
		bName := spec first.
		button := ToggleButton
			onForm: (ScratchFrameMorph skinAt: (bName, 'ButtonPressed') asSymbol)
			offForm: (ScratchFrameMorph skinAt: (bName, 'Button') asSymbol)
			overForm: (ScratchFrameMorph skinAt: (bName, 'ButtonPressed') asSymbol).
		button
			target: self;
			actionSelector: (spec at: 2);
			isMomentary: true;
			setBalloonText: (spec at: 3) localized maxLineLength: 100.

		stageButtonsPanel addMorphBack: button.
		bName = #go ifTrue: [
			flagButton := button.
			stageButtonsPanel addMorphBack: (Morph new color: Color transparent; extent: 5@5)].
		bName = #stop ifTrue: [
			stopButton := button]].

	titlePane addMorph: stageButtonsPanel.
! !
