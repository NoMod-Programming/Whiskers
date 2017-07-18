
!ScratchProcess methodsFor: 'private-special forms' stamp: 'EMP 7/16/2017 18:03'!
stopScripts
	| firstArg args stage |
	stackFrame needsMoreArgumentsEvaluated
		ifTrue: [^ self evaluateNextArgument].
	args := stackFrame arguments.
	args size > 0
		ifTrue: [firstArg := args first]
		ifFalse: [firstArg := nil].
	firstArg = 'this script'
		ifTrue: [[stackFrame isNil]
				whileFalse: [self popStackFrame].
			stackFrame
				ifNotNil: [self returnValueToParentFrame: firstArg.
					self popStackFrame].
			answer
				ifNil: [answer := ''].
			^ self].
	firstArg = 'all'
		ifTrue: [stage := stackFrame expression receiver ownerThatIsA: ScratchStageMorph.
			stage
				ifNotNil: [stage stopAll].
			self stop.
			answer
				ifNil: [answer := ''].
			^ self].
	firstArg = 'other scripts in sprite'
		ifTrue: [stackFrame expression receiver blocksBin submorphs
				do: [:t4 | ((t4 isKindOf: BlockMorph)
							and: [t4 ~= topBlock])
						ifTrue: [t4 clearProcess]].
			self popStackFrame.
			^ self].
	firstArg = 'other scripts in stage'
		ifTrue: [stackFrame expression receiver blocksBin submorphs
				do: [:t4 | ((t4 isKindOf: BlockMorph)
							and: [t4 ~= topBlock])
						ifTrue: [t4 clearProcess]].
			self popStackFrame.
			^ self].! !
