
!Pkcs12PrivateKeyFileReader methodsFor: 'accessing' stamp: 'rww 4/8/2007 20:36'!
asPrivateKey

	self privateKeys isEmpty ifTrue: [^ nil].
	^ self privateKeys first! !
