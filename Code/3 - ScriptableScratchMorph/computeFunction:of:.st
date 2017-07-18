
!ScriptableScratchMorph methodsFor: 'other ops' stamp: 'EMP 7/16/2017 19:24'!
computeFunction: functionName of: aNumber
	"Return the result of computing the given mathematical function on the given number."

	'abs' = functionName ifTrue: [^ aNumber abs].
	'floor' = functionName ifTrue: [^ aNumber floor].
	'ceiling' = functionName ifTrue: [^ aNumber ceiling].
	'sqrt' = functionName ifTrue: [^ aNumber sqrt].
	'sin' = functionName ifTrue: [^ aNumber degreesToRadians sin].
	'cos' = functionName ifTrue: [^ aNumber degreesToRadians cos].
	'tan' = functionName ifTrue: [^ aNumber degreesToRadians tan].
	'asin' = functionName ifTrue: [^ (aNumber within: -1.0 and: 1.0) arcSin radiansToDegrees].
	'acos' = functionName ifTrue: [^ (aNumber within: -1.0 and: 1.0) arcCos radiansToDegrees].
	'atan' = functionName ifTrue: [^ aNumber arcTan radiansToDegrees].
	
	'ln' = functionName ifTrue: [^ aNumber ln].
	'log' = functionName ifTrue: [^ aNumber log].
	'e ^' = functionName ifTrue: [^ aNumber exp].
	'10 ^' = functionName ifTrue: [^ 10.0 raisedTo: aNumber].

	^ 0
! !
