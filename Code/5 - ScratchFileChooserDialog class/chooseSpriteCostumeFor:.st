
!ScratchFileChooserDialog class methodsFor: 'instance creation' stamp: 'EMP 7/16/2017 11:24'!
chooseSpriteCostumeFor: aScratchFrameMorph
	"ScratchFileChooserDialog chooseSpriteCostumeFor: nil"

	| m |
	ScratchFileChooserDialog deleteDuplicates.
	m := self new
		createFileChooserLayout: false;
		title: 'New Sprite';
		showThumbnails: true;
		type: #costume;
		extensions: #(gif jpeg jpg bmp png svg sprite);
		scratchFrame: aScratchFrameMorph;
		listExtent: 550@300.

	^ m getUserResponse
! !
