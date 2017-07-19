

!RSAKeyPairGenerator methodsFor: 'accessing' stamp: 'dik 9/28/2010 14:04'!

privateKey

	^ RSAPrivateKey p: self p q: self q dP: self dp dQ: self dq qInv: self qInv! !

