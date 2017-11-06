
!ScratchCommentMorph methodsFor: 'initialization' stamp: 'EMP 11/5/2017 16:48'!
initialize

	| bottomBar |
	super initialize.
	anchorOffset := 5.

	self vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		 listDirection: #topToBottom;
		wrapCentering: #bottomRight;
		layoutInset: 0;
		borderWidth: 1;
		borderColor: ScratchFrameMorph borderColor;
		color: self commentMorphColor;
		useRoundedCorners;
		cornerRadius: 5;
		width: self defaultWidth.
	isShowing := true.

	self addTopBar.

	bottomBar := AlignmentMorph newRow
		color: Color transparent;
		wrapCentering: #center;
		layoutInset: 0.
	resizeMorph := ScratchResizeMorph ofType: #corner.
	resizeMorph vResizing: #spaceFill.
	commentMorph := MultilineStringMorph new
		color: Color transparent;
		growWithText: true;
		borderWidth: 0;
		font: (ScratchFrameMorph getFont: #CommentBlock);
		contents: 'add comment here' localized, ScratchTranslator ellipsesSuffix;
		width: self defaultWidth - resizeMorph width.
	bottomBar addMorphBack: commentMorph.
	bottomBar addMorphBack: resizeMorph.

	self addMorphBack: bottomBar.
	isResizing := false.
	resizeOffset := 0@0.
! !
