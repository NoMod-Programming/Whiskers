
!ScratchScriptEditorMorph methodsFor: 'drawing' stamp: 'EMP 7/14/2017 14:20'!
fullDrawOn: aCanvas
	"Draw my frame in front of my submorphs."

	| clipC |
	self visible ifFalse: [^ self].
	(self hasProperty: #errorOnDraw) ifTrue:[^ self drawErrorOn: aCanvas].
	(aCanvas isVisible: self fullBounds) ifFalse: [^ self].

	"myBox has integer position and extent and has a potentially inset bottom"
	clipC := aCanvas copyClipRect: bounds truncated.

	self drawOn: clipC.
	self drawSubmorphsOn: clipC.
	thumbnailMorph fullDrawOn: aCanvas.
	tabPaneMorph fullDrawOn: aCanvas.! !
