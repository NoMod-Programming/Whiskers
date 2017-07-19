
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/18/2017 16:16'!
initialize
	super initialize.
	lastParameters _ OrderedCollection new.
	self color: (ScratchViewerMorph colorForCategory: 'More Blocks').
	self addParameter: #text! !
