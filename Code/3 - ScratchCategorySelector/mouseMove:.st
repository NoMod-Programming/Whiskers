
!ScratchCategorySelector methodsFor: 'event handling' stamp: 'EMP 7/14/2017 15:59'!
mouseMove: evt
	(bounds containsPoint: evt cursorPoint) ifTrue: [
		self mouseEnter: evt.
	] ifFalse: [
		self mouseLeave: evt.
	]! !
