
!RSAKeyPairGenerator methodsFor: 'private' stamp: 'dik 9/28/2010 13:47'!
dq

	^dQ ifNil: [ dQ := self d \\ (self q - 1) ]! !
