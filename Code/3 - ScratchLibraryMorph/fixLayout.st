
!ScratchLibraryMorph methodsFor: 'geometry' stamp: 'EMP 7/16/2017 21:40'!
fixLayout
	"Position and size thumbnails."

	| libPane x y rMargin |
	scrollPane isNil | stagePane isNil | spritePane isNil ifTrue: [^ self].

	spritePane width: self width.
	spritePane height: topSectionHeight.
	
	buttonPane top: (self top + (topSectionHeight // 2) - (buttonPane height // 2) + 14);
		right: self right - 17.

	stagePane height = self height ifFalse: [
		stagePane height: self height].
	scrollPane height = self height ifFalse: [
		scrollPane height: self height - topSectionHeight].
	scrollPane width = (self right - stagePane right) ifFalse: [
		scrollPane width: self right - stagePane right].

	scrollPane position: scrollPane left @ (self top + topSectionHeight + 13).
	stagePane position: stagePane left @ (self top + topSectionHeight + 21).

	libPane := scrollPane contents.
	ScratchTranslator isRTL
		ifTrue: [x := libPane left + 30]
		ifFalse: [x := libPane left + 8].
	y := libPane top + 7.
	rMargin := x + scrollPane width - 5.
	libPane submorphs do: [:m |
		(x + m width) > rMargin ifTrue: [
			ScratchTranslator isRTL
				ifTrue: [x := libPane left + 30]
				ifFalse: [x := libPane left + 8].
			y := y + m height].
		m position: x@y.
		x := x + m width].

	stagePane submorphCount > 0 ifTrue: [|m|
		m := stagePane firstSubmorph.
		m position: stagePane topLeft + ((stagePane extent - stagePane firstSubmorph extent) // 2) - (0@topSectionHeight)].
! !
