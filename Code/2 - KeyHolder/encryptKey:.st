
!KeyHolder methodsFor: 'services' stamp: 'RJT 2/9/2007 10:18'!
encryptKey: pKey
	| eKey |
	eKey := (TripleDES key: self random) cbc encrypt: pKey.
	self data key: eKey! !
