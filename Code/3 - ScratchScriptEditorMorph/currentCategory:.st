
!ScratchScriptEditorMorph methodsFor: 'accessing' stamp: 'EMP 7/14/2017 16:56'!
currentCategory: aString

	| xOffset |
	currentCategory := aString.
	self target ifNil: [^ self].
	xOffset := 0.

	World activeHand newKeyboardFocus: nil.

	viewerPane owner ifNotNil: [
		viewerPane delete
	].
	thumbnailMorph owner ifNotNil: [
		thumbnailMorph delete
	].

	currentCategory = 'Scripts' ifTrue: [
		pageViewerMorph contents: self target blocksBin.
		self addMorph: viewerPane;
			addMorph: thumbnailMorph].
	currentCategory = 'Costumes' ifTrue: [
		pageViewerMorph contents: (self target costumesPage: xOffset)].
	currentCategory = 'Sounds' ifTrue: [
		pageViewerMorph contents: (self target soundsPage: xOffset)].

	pageViewerMorph contents color: ScratchFrameMorph scriptsPaneColor.

	self world ifNotNil: [self world startSteppingSubmorphsOf: pageViewerMorph contents].

! !
