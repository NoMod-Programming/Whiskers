

!RSAPublicKey methodsFor: 'process' stamp: 'rww 9/21/2010 14:41'!

v15Verify: aSignature isSignatureOf: aMessage

	"Answer true if the given signature string signs the given message."



	^ self 

		v15VerifySignature: aSignature 

		ofMessageHash: (

			SHA1 digestInfoAsn1DerEncodingFromMessage: aMessage).

! !

