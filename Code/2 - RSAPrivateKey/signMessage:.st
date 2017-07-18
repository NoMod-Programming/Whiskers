
!RSAPrivateKey methodsFor: 'process' stamp: 'acp 5/5/2017 19:53'!
signMessage: aStringOrStream

	^ self v15SignMessage: aStringOrStream asByteArray! !
