

!DSAPrivateKey methodsFor: 'process' stamp: 'len 11/15/2002 23:04'!

signMessage: aStringOrStream

	| hasher h sig |



	hasher := SHA1 new.

	(aStringOrStream class isBytes)

		ifTrue: [h := hasher hashMessage: aStringOrStream]

		ifFalse: [h := hasher hashStream: aStringOrStream].

	sig := self computeSignatureForMessageHash: h.

	^ self signatureToString: sig! !

