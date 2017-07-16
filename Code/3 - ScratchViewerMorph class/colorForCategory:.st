
!ScratchViewerMorph class methodsFor: 'category' stamp: 'EMP 7/13/2017 18:42'!
colorForCategory: aCategory
	| colorTuple |
	colorTuple := CatList detect: [:m | m first = aCategory] ifNone: [^ Color r: 214 g: 40 b: 40 range: 255].
	^ Color r: colorTuple second g: colorTuple third b: colorTuple fourth range: 255! !
