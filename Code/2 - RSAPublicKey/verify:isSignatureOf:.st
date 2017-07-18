
!RSAPublicKey methodsFor: 'process' stamp: 'acp 5/5/2017 19:51'!
verify: signatureString isSignatureOf: aStringOrStream
	"sugar"

	^ self v15Verify: signatureString asByteArray isSignatureOf: aStringOrStream asByteArray! !
