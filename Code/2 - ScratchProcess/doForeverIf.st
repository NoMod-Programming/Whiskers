
!ScratchProcess methodsFor: 'private-special forms' stamp: 'EMP 7/17/2017 16:12'!
doForeverIf
	"Executes one iteration of a forever loop."

	| oldFrame |
	oldFrame := stackFrame.

	"evaluate the condition if we haven't yet"
	stackFrame numberOfArgumentsReady < 1 ifTrue: [^ self evaluateNextArgument].

	"remove the current frame and replace it with one that will force the test expression to be re-evaluated."
	self popStackFrameNoUnhightlight.
	self pushStackFrame: oldFrame toEvaluateExpression.
	self isAtomic ifFalse: [self pushStackFrame: ScratchStackFrameToYield new]. "yield after possibly running body"

	"if the condition was true, run the body"
	oldFrame firstArg ifTrue: [self pushStackFrame: oldFrame toEvaluateFirstBlockList].

! !
