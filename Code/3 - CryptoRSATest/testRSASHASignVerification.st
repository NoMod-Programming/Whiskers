
!CryptoRSATest methodsFor: 'tests' stamp: 'dik 9/23/2010 11:31'!
testRSASHASignVerification

	| signBytes |
	
	signBytes := privateKey v15SignMessage: 'hello'.  
	
	self assert: (publicKey v15Verify: signBytes isSignatureOf: 'hello')! !
