
!DialogBoxMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 17:27'!
title: aString
	"Note: Title is actually two StringMorphs with the same contents and font: a gray shadow of the text with a white submorph of the same text, offset by a small amount."
	"Note: we ought to be able to change the title simply by snedig #contents: to the titleMorph but there is some problem with it getting the bounds right which can then mess up the title centering. Sigh"

	"titleBin ifNotNil: [titleBin delete]."
	titleBin removeAllMorphs.
	titleMorph ifNotNil: [titleMorph delete].

	titleMorph  :=  StringMorph new
		contents: aString localized;
		color: ScratchFrameMorph textColor;
		font: (ScratchFrameMorph getFont: #DialogBoxTitle);
		lock.

	titleBin
		addMorph: titleMorph.

	"self addMorphBack: titleBin."
	self changed.
! !
