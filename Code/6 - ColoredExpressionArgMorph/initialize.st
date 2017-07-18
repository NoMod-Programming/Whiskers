
!ColoredExpressionArgMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 12:23'!
initialize
	super initialize.
	type _ #string.
	self color: (Color r: 89/255 g: 71/255 b:177/255) lighter lighter lighter.
	self stringExpression: 'undefined'.
	labelMorph textColor: (Color white)! !
