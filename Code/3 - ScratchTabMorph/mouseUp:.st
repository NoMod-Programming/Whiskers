
!ScratchTabMorph methodsFor: 'event handling' stamp: 'EMP 7/14/2017 16:02'!
mouseUp: evt
	(bounds containsPoint: evt cursorPoint) ifTrue: [
		selected := true.
		mouseOver := false.
		owner currentTab: label.
		self changed
	]! !