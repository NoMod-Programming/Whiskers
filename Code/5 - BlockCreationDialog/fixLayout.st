
!BlockCreationDialog methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 22:27'!
fixLayout
	| xPos yPos shortcutWidth fileColumnWidth |
	shortcutColumn ifNil: [^ self].
	xPos := self left + 20.
	yPos := self top + 40.

	"position and size the shortcut column"
	shortcutColumn position: xPos@yPos.
	shortcutWidth := 0.
	shortcutColumn submorphsDo: [: m |
		shortcutWidth := m width max: shortcutWidth].
	shortcutColumn submorphsDo: [: m |
		m width: shortcutWidth].

	"position main column"
	mainColumn center: ((self width // 2) + self left)@(yPos + (mainColumn height // 2)).

	"position and size the fileInfo column"
	fileInfoColumn position: (mainColumn right + 5)@yPos.
	fileColumnWidth := 0.
	fileInfoColumn submorphsDo: [: m |
		fileColumnWidth := m width max: fileColumnWidth].
	fileInfoColumn submorphsDo: [: m |
		(m isKindOf: StringMorph)
			ifFalse: [m width: fileColumnWidth]].

	"position and size title"
	titleBin center: self center.
	titleBin top: self top.

	"add a bottom spacer to the tallest column"
	bottomSpacer ifNil: [
		bottomSpacer := (Morph new extent: (5@22); color: Color transparent).
		(shortcutColumn height > mainColumn height)
			ifTrue: [shortcutColumn addMorphBack: bottomSpacer]
			ifFalse: [(mainColumn height > fileInfoColumn height)
				ifTrue: [mainColumn addMorphBack: bottomSpacer]
ifFalse: [fileInfoColumn addMorphBack: bottomSpacer]]].! !
