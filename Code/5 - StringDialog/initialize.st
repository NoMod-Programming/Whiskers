
!StringDialog methodsFor: 'initialization' stamp: 'EMP 11/5/2017 17:24'!
initialize
	"Similar to my superclass, but with a string field for the user's response."

	super initialize.
	responseArea := AlignmentMorph new
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		listCentering: #topLeft;
		wrapCentering: #center;
		layoutInset: (0@8 extent: 0@10);
		cellInset: 0@0. 
	mainColumn addMorph: responseArea.

	self title: '?'.

	"create and position typeinMorph"
	responseArea
		addMorph: (typeinMorph := StringFieldMorph
			new client: self;
			borderWidth: 2;
			color: (Color r: (211/255) g: (214/255) b: (216/255))).
	typeinMorph
		font: (ScratchFrameMorph getFont: #StringDialogTypeIn);
		width: 120.

	tabFields add: typeinMorph.
! !
