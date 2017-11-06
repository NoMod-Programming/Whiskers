
!ScratchCommentMorph methodsFor: 'initialization' stamp: 'EMP 11/5/2017 16:54'!
addTopBar

	| topBarMorph |
	topBarMorph := AlignmentMorph newRow
		extent: (160@12);
		vResizing: #shrinkWrap;
		color: self topBarColor;
		borderWidth: 0;
		layoutInset: 5@0;
		cellInset: 3@0;
		wrapCentering: #center;
		useRoundedCorners;
		cornerRadius: 5.

	labelMorph := StringMorph new
		color: (Color gray: 0.33);
		contents: '';
		font: (ScratchFrameMorph getFont: #Label).
	labelMorph lock.

	showHideMorph := ImageMorph new image: (ScratchFrameMorph skinAt: #arrowOpenComment).
	showHideMorph form colors: (Array
		with: (self color mixed: 0.5 with: Color black)
		with: Color transparent).

	topBarMorph
		addMorphBack: showHideMorph;
		addMorphBack: labelMorph.
		
	self addMorphBack: topBarMorph.
! !
