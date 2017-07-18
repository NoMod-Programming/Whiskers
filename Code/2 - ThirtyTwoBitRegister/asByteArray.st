
!ThirtyTwoBitRegister methodsFor: '*cryptography-core-accessing' stamp: 'len 8/7/2002 17:37'!
asByteArray
	^ ByteArray with: (low bitAnd: 16rFF) with: (low bitShift: -8) with: (hi bitAnd: 16rFF) with: (hi bitShift: -8)! !
