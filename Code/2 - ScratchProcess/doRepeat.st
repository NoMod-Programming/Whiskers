
!ScratchProcess methodsFor: 'private-special forms' stamp: 'EMP 7/17/2017 16:13'!
doRepeat
	| oldFrame counter frame |
	"Handles one iteration of a repeat block."
	oldFrame := stackFrame.

	"If we haven't done so yet, evaluate the argument to repeat."
	stackFrame numberOfArgumentsReady < 1 ifTrue: [^self evaluateNextArgument].

	"If the number of times to repeat is 0, then we're done."
	counter := stackFrame firstArg asNumberNoError.
	counter <= 0 ifTrue:	[^ self popStackFrame].

	"Pop this instruction from the stack."
	self popStackFrameNoUnhightlight.

	"At top of stack should now be:
		1.  evaluate body of repeat block.
		2.  yield.
		3.  evaluate repeat block with decremented counter value.
	Need to add these to the stack in reverse order."

	"3.  evaluate repeat block with decremented counter value."
	frame := oldFrame toEvaluateExpression addArgument: counter - 1.
	self pushStackFrame: frame.

	"2.  yield."
	self isAtomic ifFalse: [self pushStackFrame: ScratchStackFrameToYield new].

	"1.  evaluate body of repeat block."
	self pushStackFrame: oldFrame toEvaluateFirstBlockList
! !
