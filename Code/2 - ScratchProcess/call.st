
!ScratchProcess methodsFor: 'private-special forms' stamp: 'EMP 7/17/2017 16:09'!
call
	| block lambda argsList script varsFrame params iLimiT stopFrame |
	self isAtomic.
	block _ stackFrame expression.
	stackFrame arguments size < block argumentCount ifTrue: [^ self evaluateNextArgument].

	lambda _ block.
	argsList _ stackFrame arguments.
	script _ (lambda procedure ifNil: [^ self popStackFrame]) blockSequence allButFirst collect: [:m | m fullCopy].
	atomicityList ifNil: [atomicityList _ OrderedCollection new].
	atomicityList add: lambda isAtomic.
	blockVarList ifNil: [blockVarList _ OrderedCollection new].
	blockVarList add: (Dictionary new addKeys: lambda allVarNames).
	varsFrame _ blockVarList last.
	params _ block allVarNames.
	params size > 0
		ifTrue: 
			[iLimiT _ argsList size.
			(1 to: iLimiT)
				do: [:i | argsList size >= i ifTrue: [varsFrame at: (params at: i)
							put: (argsList at: i)]]].
	scriptList ifNil: [scriptList _ OrderedCollection new].
	scriptList add: script.

	stopFrame _ ScratchStackFrameToPerform selector: #closeCustomBlock.
	self pushStackFrame: stopFrame.
	self pushStackFrame: (ScratchStackFrame forExpression: script).
	self bindStopBlocksIn: script to: stopFrame.! !
