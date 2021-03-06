
!ScratchPresenterMorph methodsFor: 'initialization' stamp: 'EMP 7/14/2017 13:22'!
initialize

	| button exitSpec exitbutton |
	super initialize.
	self color: Color black.
	lastStepTime := IdentityDictionary new.

	exitSpec := #(fullScreen	exitPresentation		'Exit presentation').
	exitbutton := ToggleButton
			onForm: (ScratchFrameMorph skinAt: (exitSpec first, 'On'))
			offForm: (ScratchFrameMorph skinAt: (exitSpec first, 'On'))
			overForm: (ScratchFrameMorph skinAt: (exitSpec first, 'On')).
	exitbutton
			target: self;
			actionSelector: exitSpec second;
			isMomentary: true;
			actWhen: #buttonUp;
			setBalloonText:  exitSpec third localized maxLineLength: 100;
			drawToolTipAbove: true;
			off.
	buttons := #(
		(go					shoutGo				'Start green flag scripts')
		(stop				stopAll				'Stop everything')
	) collect: [:spec |
		button := ToggleButton
			onForm: (ScratchFrameMorph skinAt: (spec first, 'ButtonPressed'))
			offForm: (ScratchFrameMorph skinAt: (spec first, 'Button'))
			overForm: (ScratchFrameMorph skinAt: (spec first, 'ButtonPressed')).
		button
			target: self;
			actionSelector: spec second;
			isMomentary: true;
			actWhen: #buttonUp;
			setBalloonText:  spec third localized maxLineLength: 100;
			drawToolTipAbove: true;
			off.
		#shoutGo = spec second ifTrue: [flagButton := button].
		button].
	buttons := {exitbutton}, buttons.
	buttons do: [:b | self addMorph: b].
! !
