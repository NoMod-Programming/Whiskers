
!ScratchProcess methodsFor: 'private-special forms' stamp: 'EMP 7/17/2017 16:13'!
doWaitUntil
	"Evaluates the the wait condition until it evaluates to true."

	| oldFrame |
	"evaluate the termination expression if we haven't yet."
	stackFrame numberOfArgumentsReady < 1 ifTrue: [^ self evaluateNextArgument].

	"if the termination condition is met, pop this frame and we're done."
	stackFrame firstArg ifTrue: [^ self popStackFrame].

	oldFrame := stackFrame.

	"Set up for waitUntil loop. We need to:
		1.  yield to another process
		2.  evaluate the termination expression again
	Push these onto stack in reverse order."

	"2.  evaluate this block again"
	"(Remove the current frame and replace it with one that will force the termination expression to be re-evaluated.)"
	self popStackFrameNoUnhightlight.
	self pushStackFrame: oldFrame toEvaluateExpression.

	"1.  yield to another process"
	self isAtomic ifFalse: [self pushStackFrame: ScratchStackFrameToYield new]! !
