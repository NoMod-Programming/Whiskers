
!String methodsFor: '*SVG-Morphic' stamp: 'gvc 10/3/2005 17:36'!
asSVGNumber
	"Answer the number from the string. 
	Number of the form .7 are allowed."

	^((self beginsWith: '.')
		ifTrue: ['0', self]
		ifFalse: [self]) asNumber! !
