
!ScratchProcess methodsFor: 'private-special forms' stamp: 'EMP 7/17/2017 16:13'!
doUntil: terminatingBoolean
	"Evaluates the current while or until loop expression until the loop condition evaluates to the boolean terminating value."

	| oldFrame |

	"Evaluate the condition if we haven't yet."
	stackFrame numberOfArgumentsReady < 1 ifTrue: [^self evaluateNextArgument].

	"If the condition matches the terminatingBoolean, pop this frame and we're done."
	stackFrame firstArg = terminatingBoolean ifTrue: [^self popStackFrame].

	oldFrame := stackFrame. "save the current frame"

	"Set up for an iteration of the while loop.  We need to:
		1.  evaluate the body
		2.  yield to another process
		3.  evaluate the while/until block again
	Push these onto stack in reverse order."

	"3.  evaluate the while/until block again"
	"(We remove the current frame and replace it with one that will force the argument to be re-evaluated.)"
	self popStackFrameNoUnhightlight.
	self pushStackFrame: oldFrame toEvaluateExpression.

	"2.  yield to another process"
	self isAtomic ifFalse: [self pushStackFrame: ScratchStackFrameToYield new].
	
	"1.  evaluate the body"
	self pushStackFrame: oldFrame toEvaluateFirstBlockList
! !
