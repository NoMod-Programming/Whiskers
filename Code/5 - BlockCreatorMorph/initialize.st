
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 09:58'!
initialize
	super initialize.
	lastParameters _ OrderedCollection new.
	self color: (Color r: 89/255 g: 71/255 b:177/255).
self addParameter: #text! !
