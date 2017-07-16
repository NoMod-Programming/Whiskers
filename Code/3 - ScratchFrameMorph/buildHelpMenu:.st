
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 7/16/2017 09:55'!
buildHelpMenu: aDockingBarMenuMorph

	aDockingBarMenuMorph addItem: [:line|
		line
			contents: 'Help Page' localized, ScratchTranslator ellipsesSuffix;
			font: (ScratchFrameMorph getFont: #MenuItem);
			target: self;
			selector: #launchHelpPage].
	aDockingBarMenuMorph addItem: [:line|
		line
			contents: 'Help Screens' localized, ScratchTranslator ellipsesSuffix;
			font: (ScratchFrameMorph getFont: #MenuItem);
			target: self;
			selector: #launchAllHelpScreens].
	aDockingBarMenuMorph addLine.
	aDockingBarMenuMorph addItem: [:line|
		line
			contents: 'About Whiskers' localized, ScratchTranslator ellipsesSuffix;
			font: (ScratchFrameMorph getFont: #MenuItem);
			target: self;
			selector: #aboutScratch].! !
