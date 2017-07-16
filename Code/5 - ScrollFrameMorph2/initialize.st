
!ScrollFrameMorph2 methodsFor: 'initialization' stamp: 'EMP 7/15/2017 15:49'!
initialize
	super initialize.
	self borderWidth: 0.
	self removeAllMorphs.
	self color: Color blue.
	hbarInset := 12.
	vbarInset := 12.
	scrollBarStartInset := 10.
	scrollBarEndInset := 14.
	contentsChanged := false.
	growthFraction := 0.6.
	contents := PasteUpMorph new
				color: (Color gray: 0.9);
				 borderWidth: 0;
				 enableDragNDrop: true.
	hScrollbar := ScratchScrollBar newHorizontal target: self;
				 selector: #hScrollRelative:.
	vScrollbar := ScratchScrollBar newVertical target: self;
				 selector: #vScrollRelative:.
	contents position: self position + borderWidth.
	self addMorph: contents.
	self addMorph: hScrollbar.
	self addMorph: vScrollbar! !
