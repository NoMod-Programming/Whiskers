
!RSAKeyPairGenerator methodsFor: 'private' stamp: 'dik 9/28/2010 13:46'!
dp

	^dP ifNil: [ dP := self d \\ ( self p - 1 ) ]! !
