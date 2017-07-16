
!ScratchTabPaneMorph methodsFor: 'accessing' stamp: 'EMP 7/14/2017 16:10'!
createTab: unlocalizedLabel

	| button |
	button := ScratchTabMorph new label: unlocalizedLabel; id: unlocalizedLabel.

	button position: (lastTabAdded ifNil: [-0@0] ifNotNil: [(lastTabAdded right)@(self bottom - 28)]).

	lastTabAdded := button.
	self addMorph: button.

	button height: 28.! !
