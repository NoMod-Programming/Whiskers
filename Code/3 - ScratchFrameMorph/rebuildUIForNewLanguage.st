
!ScratchFrameMorph methodsFor: 'private' stamp: 'EMP 7/13/2017 14:19'!
rebuildUIForNewLanguage
	"Rebuild my UI after the language or font has been changed."

	World fullRepaintNeeded.
	viewerPane relabelCategorySelectors.
	self updatePanes.
	self
		view: scriptsPane target
		tab: scriptsPane tabPane currentTab
		category: viewerPane currentCategory.

! !