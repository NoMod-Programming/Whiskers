
!ScratchFrameMorph methodsFor: 'intialization' stamp: 'EMP 7/14/2017 21:51'!
createMenuPanel
	"Create and add a panel containing the menus and close button."

	"create panel"
	menuPanel := DockingBarMorph new
		autoGradient: false;
		borderWidth: 0;
		borderColor: Color darkGray; "rather oddly this is used for the border of the menus no matter what other color we might set them to"
		color: Color transparent;
		disableDragNDrop.	

	self addShortcutButtonsTo: menuPanel.

	menuPanel addItem: [:item|
						item
							contents: 'File' localized;
							font: (ScratchFrameMorph getFont: #MenuTitle);
							color: Color white;
							subMenuUpdater: self
							selector: #buildFileMenu: ].
	menuPanel addItem: [:item|
						item
							contents: 'Edit' localized;
							font: (ScratchFrameMorph getFont: #MenuTitle);
							color: Color white;
							subMenuUpdater: self
							selector: #buildEditMenu:].
	menuPanel addItem: [:item|
						item
							contents: 'Help' localized;
							font: (ScratchFrameMorph getFont: #MenuTitle);
							color: Color white;
							addSubMenu: [:menu| menu useRoundedCorners.
								self buildHelpMenu: menu]].


	topPane addMorphFront: menuPanel.
! !
