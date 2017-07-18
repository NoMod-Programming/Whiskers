
!ScratchTabMorph methodsFor: 'event handling' stamp: 'EMP 7/16/2017 20:01'!
mouseUp: evt
	(bounds containsPoint: evt cursorPoint) ifTrue: [
		selected := true.
		mouseOver := false.
		owner currentTab: id.
		self changed
	]! !
