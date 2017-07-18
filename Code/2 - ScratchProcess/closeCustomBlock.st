
!ScratchProcess methodsFor: 'private-stack' stamp: 'EMP 7/17/2017 16:04'!
closeCustomBlock
	blockVarList
		ifNotNil: [blockVarList size > 0
				ifTrue: 
					[blockVarList removeLast.
					atomicityList removeLast.
					scriptList removeLast]].
	stackFrame ifNotNil: [self isAtomic ifTrue: [self popStackFrameNoUnhightlight; popStackFrameNoUnhightlight] ifFalse: [self popStackFrame; popStackFrame]].! !
