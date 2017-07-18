
!ScratchProcess methodsFor: 'private-special forms' stamp: 'EMP 7/17/2017 16:13'!
doPlaySoundAndWait
	"Play a sound and block until it has finished playing."

	| snd oldFrame |
	oldFrame := stackFrame.

	"first time: send the event and collect a list of processes"
	stackFrame numberOfArgumentsReady = 0
		ifTrue: [
			(snd := stackFrame startSoundCommand) ifNil:[^ self popStackFrame]]
		ifFalse: [
			snd := stackFrame firstArg].

	"if sound has stopped, pop this frame and we're done"
	snd isPlaying ifFalse: [^ self popStackFrame].

	"Set up the wait loop. We need to:
		1.  yield to another process
		2.  evaluate our termination condition again
	Push these onto stack in reverse order."

	"2.  evaluate this block again"
	"(Remove the current frame and replace it with one that will force the termination condition to be re-evaluated.)"
	self popStackFrameNoUnhightlight.
	self pushStackFrame: (oldFrame toEvaluateExpression addArgument: snd).

	"1.  yield to another process"
	self pushStackFrame: ScratchStackFrameToYield new! !
