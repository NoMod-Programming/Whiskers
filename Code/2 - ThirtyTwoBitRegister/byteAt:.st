
!ThirtyTwoBitRegister methodsFor: '*cryptography-core-accessing' stamp: 'len 8/15/2002 01:34'!
byteAt: anInteger
	anInteger = 1 ifTrue: [^ hi bitShift: -8].
	anInteger = 2 ifTrue: [^ hi bitAnd: 16rFF].
	anInteger = 3 ifTrue: [^ low bitShift: -8].
	anInteger = 4 ifTrue: [^ low bitAnd: 16rFF]! !
