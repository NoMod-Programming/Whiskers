
!ScratchFrameMorph methodsFor: 'layout' stamp: 'EMP 7/17/2017 22:20'!
fixLayout
	workPaneWrapper ifNil: [^ self]. "Yay bugs!!"

	topPane
		position: self topLeft;
		width: self width;
		height: 28.

	stageFrame
		extent: workPaneWrapper extent + (14@42);
		top: topPane bottom;
		left: self left.

	titlePane
		position: stageFrame topLeft + (0@1);
		width: stageFrame width - 6;
		height: 36.

	self fixProjectTitleMorphLayout.

	scriptsPane fixLayout.

	scriptsPane
		position: stageFrame topRight;
		width: self width - stageFrame width;
		height: self bottom - topPane bottom;
		fixLayout.

	libraryPane position: stageFrame bottomLeft;
		width: (scriptsPane left - self left);
		height: self bottom - libraryPane top.

	menuPanel
		left: logoMorph right + 18;
		top: topPane top + ((topPane height - menuPanel height) // 2) + 2.

	stageButtonsPanel
		position: (stageFrame left + 10)@(topPane bottom + 6);
		width: stageFrame width - 28;
		height: (workPane top - stageFrame top) - 8.

	readoutPane
		position: stageFrame bottomRight - ((readoutPane width + 2)@0).

	toolbarPanel
		left: (stageFrame left - 4 max: menuPanel right);
		top: self top + ((topPane height - toolbarPanel height) // 2) + 3.
! !
