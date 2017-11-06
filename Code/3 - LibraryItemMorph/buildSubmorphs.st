
!LibraryItemMorph methodsFor: 'initialization' stamp: 'EMP 11/4/2017 22:24'!
buildSubmorphs
	"LibraryItemMorph open"

	thumbnailMorph := ImageMorph new
		image: (Form extent: thumbWidth@thumbWidth depth: 16) fillWhite;
		position: ((self width - thumbWidth) // 2) @ 0.
	self addMorph: thumbnailMorph.

	nameMorph := StringMorph new
		font: (ScratchFrameMorph getFont: #LibraryItemName);
		position: 0 @ (thumbnailMorph bottom -3);
		color: ScratchFrameMorph textColor;
		lock.
	self addMorph: nameMorph.

	"scriptCountMorph := StringMorph new
		font: (ScratchFrameMorph getFont: #LibraryItemInfo);
		contents: '';
		position: 0 @ nameMorph bottom.
	self addMorph: scriptCountMorph."

	self color: Color transparent.
! !
