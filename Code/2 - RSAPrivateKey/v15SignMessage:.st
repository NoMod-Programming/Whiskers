

!RSAPrivateKey methodsFor: 'process' stamp: 'rww 9/21/2010 14:39'!

v15SignMessage: aMessage



	^ self v15SignMessageHash: (

		SHA1 digestInfoAsn1DerEncodingFromMessage: aMessage).

! !

