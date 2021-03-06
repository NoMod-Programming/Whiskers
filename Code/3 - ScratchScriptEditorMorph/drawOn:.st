
!ScratchScriptEditorMorph methodsFor: 'drawing' stamp: 'EMP 7/14/2017 17:01'!
drawOn: aCanvas
	"Draw my background."

	aCanvas fillRectangle: bounds color: color.

	aCanvas
		frameRectangle: pageViewerMorph bounds
		width: 1
		color: ScratchFrameMorph borderColor.

	currentCategory = 'Scripts' ifTrue: [
	aCanvas fillRectangle: ((viewerPane bounds merge: pageViewerMorph bounds) extendBy: (2@0)) color: ScratchFrameMorph palettePaneColor.
	aCanvas
		frameRectangle: ((viewerPane topLeft - (1@1)) corner: (pageViewerMorph bottomRight + (3@4)))
		width: 1
		color: ScratchFrameMorph borderColor
	] ifFalse: [
	aCanvas frameRectangle: (pageViewerMorph bounds expandBy: 1) width: 1 color: ScratchFrameMorph borderColor
	]! !
