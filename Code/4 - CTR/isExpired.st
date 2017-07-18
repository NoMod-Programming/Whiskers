
!CTR methodsFor: 'private' stamp: 'cmm 12/2/2006 16:42'!
isExpired
	^ self nonce = self highestNonce ! !
