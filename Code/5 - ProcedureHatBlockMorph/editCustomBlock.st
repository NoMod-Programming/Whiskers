
!ProcedureHatBlockMorph methodsFor: 'accessing' stamp: 'EMP 7/17/2017 14:44'!
editCustomBlock
	| resultArray oldSpec |
	oldSpec _ spec.
	resultArray _ ((BlockCreationDialog forCustomBlock: {spec. self findArgs. isAtomic}) getUserResponse).
	resultArray = false ifTrue: [^ self beep].
	self spec: resultArray first first.
	self params: resultArray first second.
	self isAtomic: resultArray second.
	self receiver bindCustom: oldSpec to: spec.! !
