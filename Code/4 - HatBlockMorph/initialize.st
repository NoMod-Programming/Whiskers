
!HatBlockMorph methodsFor: 'initialization' stamp: 'EMP 7/17/2017 08:54'!
initialize

	super initialize.
	self color: (ScratchViewerMorph colorForCategory: 'Events').
	self extent: 92@38.
	scriptOwner := nil.

	scriptNameMorph := StringMorph new
		contents: 'script';
		font: (ScratchFrameMorph getFont: #Label);
		color: Color white;
		lock.
	self addMorph: scriptNameMorph.
! !
