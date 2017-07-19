
!ScratchFrameMorph class methodsFor: 'scratch skin' stamp: 'EMP 7/18/2017 16:41'!
skinAt: aSymbolOrString ifAbsent: aBlock
	"Answer the skin image with the given name. In XO mode, first check to see if an entry appears in ScratchSkinXO. If so, use it. Otherwise, use the image from the normal skin dictionary."

	| k |
	"loading can result in this being sent before I have been initialised, so catch the lack of ScratchSkin"
	ScratchSkin ifNil:[self readSkinFrom: (FileDirectory default directoryNamed: 'ScratchSkin')].
	k := aSymbolOrString asSymbol.
	self isXO ifTrue: [
		k = #scriptsPaneTexture ifTrue: [^ aBlock value].
		(ScratchSkinXO includesKey: k) ifTrue: [^ ScratchSkinXO at: k]].

	^ ScratchSkin at: k ifAbsent: aBlock
! !
