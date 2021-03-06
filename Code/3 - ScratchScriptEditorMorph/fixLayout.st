
!ScratchScriptEditorMorph methodsFor: 'geometry' stamp: 'EMP 7/14/2017 16:51'!
fixLayout

	viewerPane position: self left + 1 @ (self top + topSectionHeight + 1);
		height: self height - topSectionHeight - 4;
		width: ((viewerPane catButtonsExtent x + 17) within: 40 and: (self width - self bareMinimumWidth)).

	"place tab morph"
	tabPaneMorph
		width: self width;
		position: self left @ (self top + 6).
	thumbnailMorph right: self right - 10;
		top: self top + 40.

	"place scripts scroll pane"
	currentCategory = 'Scripts' ifTrue: [
		pageViewerMorph position: viewerPane topRight + (0@6).
	] ifFalse: [
		pageViewerMorph position: (tabPaneMorph bottomLeft + (1@0)).
	].
	self extent: self extent. "force resize of page viewer morph"
! !
