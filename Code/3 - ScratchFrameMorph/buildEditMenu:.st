
!ScratchFrameMorph methodsFor: 'menu/button actions' stamp: 'EMP 7/14/2017 19:20'!
buildEditMenu: aDockingBarMenuMorph 
	"build the edit menu - which depends upon the shift key state. We
	ought to get the event with this in order to find the shift key state
	but we don't. Sigh."
	aDockingBarMenuMorph
		useRoundedCorners
		addItem: [:line | line contents: 'Undelete' localized;
				font: (ScratchFrameMorph getFont: #MenuItem);
				 target: self;
				 selector: #undoTool].

	aDockingBarMenuMorph addLine.

	ScratchProcess blockHighlightMSecs <= 1
		ifTrue: [aDockingBarMenuMorph
				addItem: [:line | line contents: 'Start Single Stepping' localized;
						font: (ScratchFrameMorph getFont: #MenuItem);
						 target: self;
						 selector: #toggleSingleStepping]]
		ifFalse: [aDockingBarMenuMorph
				addItem: [:line | line contents: 'Stop Single Stepping' localized;
						font: (ScratchFrameMorph getFont: #MenuItem);
						 target: self;
						 selector: #toggleSingleStepping]].
	aDockingBarMenuMorph
		addItem: [:line | line contents: 'Set Single Stepping' localized;
				font: (ScratchFrameMorph getFont: #MenuItem);
				 target: self;
				 selector: #setSingleStepping].

	aDockingBarMenuMorph addLine.

	aDockingBarMenuMorph
		addItem: [:line | line contents: 'Compress Sounds' localized , ScratchTranslator ellipsesSuffix;
				font: (ScratchFrameMorph getFont: #MenuItem);
				 target: self;
				 selector: #compressSounds].
	aDockingBarMenuMorph
		addItem: [:line | line contents: 'Compress Images' localized , ScratchTranslator ellipsesSuffix;
				font: (ScratchFrameMorph getFont: #MenuItem);
				 target: self;
				 selector: #compressImages].

	aDockingBarMenuMorph addLine.

	workPane showMotorBlocks
		ifTrue: [aDockingBarMenuMorph
				addItem: [:line | line contents: 'Hide Motor Blocks' localized;
						font: (ScratchFrameMorph getFont: #MenuItem);
						 target: self;
						 selector: #hideMotorBlocks]]
		ifFalse: [aDockingBarMenuMorph
				addItem: [:line | line contents: 'Show Motor Blocks' localized;
						
						font: (ScratchFrameMorph getFont: #MenuItem);
						 target: self;
						 selector: #showMotorBlocks]].
	self class environment at: #ScratchGPIOServer
		ifPresent: [:gpioServer | gpioServer isEnabled
				ifTrue: [workPane connectedToGpio
						ifTrue: [aDockingBarMenuMorph
								addItem: [:line | line contents: 'Stop GPIO server' localized;
										font: (ScratchFrameMorph getFont: #MenuItem);
										 target: self;
										 selector: #stopGpioServer]]
						ifFalse: [aDockingBarMenuMorph
								addItem: [:line | line contents: 'Start GPIO server' localized;
										font: (ScratchFrameMorph getFont: #MenuItem);
										 target: self;
										 selector: #startGpioServer]]]].

	self currentHand lastEvent shiftPressed ifTrue: [
		aDockingBarMenuMorph addItem: [:item |
			item
				contents: 'Developer...';
				target: self;
				subMenuUpdater: self selector: #developersMenu:.
		]
	].! !
