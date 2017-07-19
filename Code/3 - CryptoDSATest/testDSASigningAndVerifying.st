

!CryptoDSATest methodsFor: 'DSA' stamp: 'rww 10/5/2006 06:48'!

testDSASigningAndVerifying

	| msg sig |

	msg := 'This is a test...'.

	sig := self dsaPrivateKey signMessage: msg.

	self assert: (self dsaPublicKey verify: sig isSignatureOf: msg)! !

