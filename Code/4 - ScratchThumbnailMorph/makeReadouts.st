
!ScratchThumbnailMorph methodsFor: 'initialization' stamp: 'EMP 7/13/2017 14:01'!
makeReadouts
	xreadout := UpdatingStringMorph new
		target: self;
		getSelector: #spriteX;
		font: (ScratchFrameMorph getFont: #XYReadoutBold);
		stepTime: 25;
		growable: false;
		useStringFormat;
		contents: 'x: -888';
		color: (Color r: 0.5 g: 0.5 b: 0.5).
	xreadout maximumWidth: xreadout width.
	yreadout := xreadout fullCopy getSelector: #spriteY.
	self addMorph: xreadout;
		addMorph: yreadout.! !
