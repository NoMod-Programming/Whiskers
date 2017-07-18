
!ColoredExpressionArgMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 12:15'!
forType: aSymbol

	type _ aSymbol.
	aSymbol = #number ifTrue: [isNumber _ true] ifFalse: [isNumber _ false]! !
