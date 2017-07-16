
!ExpressionArgMorph methodsFor: 'accessing' stamp: 'EMP 7/16/2017 11:30'!
defaultValue: anObject

	anObject isNumber ifTrue: [self numExpression: (anObject isNumber ifTrue: [anObject] ifFalse: [Number readFrom: anObject ifFail: [' ']])].
	(anObject isKindOf: String) ifTrue: [self stringExpression: (anObject asString)].
! !
