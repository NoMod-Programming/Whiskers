
!ScratchProcess methodsFor: 'private-special forms' stamp: 'EMP 7/17/2017 16:12'!
doBroadcastAndWait
	"Broadcast an event and wait until all processes started by that broadcast have terminated."

	| block args eventName stage procs |
	block := stackFrame expression.
	args := stackFrame arguments.

	"first time: send the event and collect a list of processes"
	args size = 0
		ifTrue: [
			eventName := block args first asString.
			stage := block receiver ownerOrYourselfThatIsA: ScratchStageMorph.
			procs := stage broadcastEvent: (ScratchNamedEvent for: eventName)]
		ifFalse: [
			procs := args first].

	"if all processes have stopped, pop this frame and we're done."
	(procs select: [:p | p isRunning]) size = 0 ifTrue: [^ self popStackFrame].

	"Set up the wait loop. We need to:
		1.  yield to another process
		2.  evaluate the termination expression again
	Push these onto stack in reverse order."

	"2.  evaluate this block again"
	"(Remove the current frame and replace it with one that will force the termination expression to be re-evaluated.)"
	self popStackFrameNoUnhightlight.
	self pushStackFrame: ((ScratchStackFrame forExpression: block) addArgument: procs).

	"1.  yield to another process"
	self isAtomic ifFalse: [self pushStackFrame: ScratchStackFrameToYield new]
! !
