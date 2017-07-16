
!LibraryItemMorph methodsFor: 'initialization' stamp: 'EMP 7/14/2017 09:12'!
buildSubmorphs
	"LibraryItemMorph open"

	thumbnailMorph := ImageMorph new
		image: (Form extent: thumbWidth@thumbWidth depth: 16) fillWhite;
		position: ((self width - thumbWidth) // 2) @ 0.
	self addMorph: thumbnailMorph.

	nameMorph := StringMorph new
		font: (ScratchFrameMorph getFont: #LibraryItemName);
		position: 0 @ (thumbnailMorph bottom -3);
		color: (Color r: 92 g: 93 b: 95 range: 255);
		lock.
	self addMorph: nameMorph.

	"scriptCountMorph := StringMorph new
		font: (ScratchFrameMorph getFont: #LibraryItemInfo);
		contents: '';
		position: 0 @ nameMorph bottom.
	self addMorph: scriptCountMorph."

	self color: Color transparent.
! !
