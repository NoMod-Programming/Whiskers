
!CommandBlockMorph methodsFor: 'evaluation' stamp: 'EMP 7/17/2017 16:58'!
evaluateWithArgs: rawArgs
	"Evalue this block with the given argument list."

	| args |
	"special case for math and boolean infix operators"
	selector isInfix ifTrue: [^ self evaluateInfixWithArgs: rawArgs].

	args  :=  self coerceArgs: rawArgs..

	"special case for unary operators"
	(#(abs not rounded sqrt truncated) includes: selector) ifTrue: [^ args first perform: selector].

	self selector == #createCloneOf ifTrue: [^ receiver perform: #createCloneOf: withArguments: args].
	self selector == #startScene ifTrue: [^ receiver perform: #changeBackdropTo: withArguments: args].
	self selector == #timeAndDate ifTrue: [^ receiver perform: #getDateOrTime: withArguments: args].
	self selector == #setRotationStyle ifTrue: [^ receiver perform: #setRotStyle: withArguments: args].

	^ receiver perform: selector withArguments: args
! !
