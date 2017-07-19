
!ProcedureHatBlockMorph methodsFor: 'accessing' stamp: 'EMP 7/18/2017 12:11'!
editCustomBlock
	| resultArray oldSpec |
	oldSpec _ spec.
	resultArray _ ((BlockCreationDialog forCustomBlock: {spec. self findArgs. isAtomic}) getUserResponse).
	resultArray = false ifTrue: [^ self].
	self spec: resultArray first first.
	self params: resultArray first second.
	self isAtomic: resultArray second.
	self receiver bindCustom: oldSpec to: spec.! !
