
!Json class methodsFor: 'as yet unclassified' stamp: 'ul 11/9/2010 04:07'!
escapeForCharacter: c
	
	| asciiValue |
	(asciiValue := c asciiValue) < 128
		ifTrue: [ ^escapeArray at: asciiValue + 1 ].
	^nil! !
