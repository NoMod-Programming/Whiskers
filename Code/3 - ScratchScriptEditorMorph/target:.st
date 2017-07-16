
!ScratchScriptEditorMorph methodsFor: 'accessing' stamp: 'EMP 7/13/2017 12:53'!
target: aScratchObjectOrNil
	"Start viewing the given object or no object."

	| nameSel |
	World activeHand newKeyboardFocus: nil.
	(aScratchObjectOrNil isNil or:
	 [aScratchObjectOrNil isScriptable not]) ifTrue: [
		thumbnailMorph target: nil.
		target := nil.
		pageViewerMorph contents: (Morph new color: Color red).

		self ownerScratchFrame ifNotNil: [:fr|
			fr viewerPane target: nil].
		^ self].

	thumbnailMorph target: aScratchObjectOrNil.

	nameSel := (aScratchObjectOrNil isKindOf: ScratchStageMorph)
		ifTrue: [nil]
		ifFalse: [#objName:].
	target := aScratchObjectOrNil.

	self layoutChanged.
! !
