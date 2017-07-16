
!ScratchFileChooserDialog class methodsFor: 'instance creation' stamp: 'EMP 7/16/2017 11:24'!
chooseImageFileType: type title: aString
	"ScratchFileChooserDialog chooseImageFileType: #costume title: 'Costume'"

	| m |
	ScratchFileChooserDialog deleteDuplicates.
	m := self new
		createFileChooserLayout: false;
		showThumbnails: true;
		type: type;
		extensions: #(gif jpeg jpg bmp png svg);
		title: aString;
		listExtent: 550@300.

	"allow sprites to be imported into the paint editor:"
	aString = 'Import Image' ifTrue: [
		m extensions: #(gif jpeg jpg bmp png svg sprite)].

	^ m getUserResponse
! !
