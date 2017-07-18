
!BlockCreationDialog methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 11:45'!
updateWidth: aNumber
	self extent: (aNumber + 60 max: 385) @ (self height).
self fixLayout! !
