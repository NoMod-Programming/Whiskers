
!RSAKeyPairGenerator methodsFor: 'private' stamp: 'len 8/3/2002 21:31'!
d
	d isNil ifFalse: [^ d].
	^ d := self e inverseModulo: self p - 1 * (self q - 1)! !
