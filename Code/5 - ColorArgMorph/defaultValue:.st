
!ColorArgMorph methodsFor: 'other' stamp: 'EMP 7/17/2017 16:42'!
defaultValue: aColor

	aColor isNumber ifTrue: [^ self setColor: (Color fromString: '#'
					, (aColor printStringRadix: 16))].
	self setColor: aColor.
! !
