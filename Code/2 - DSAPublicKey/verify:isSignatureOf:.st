

!DSAPublicKey methodsFor: 'process' stamp: 'len 8/15/2002 02:17'!

verify: signatureString isSignatureOf: aStringOrStream

	"Answer true if the given signature string signs the given message (a stream or string)."

	"Note: Random numbers are not needed for signature verification; thus, there is no need to call initRandomFromUser before verifying a signature."



	| hasher h sig |

	hasher := SHA1 new.

	(aStringOrStream class isBytes)

		ifTrue: [h := hasher hashMessage: aStringOrStream]

		ifFalse: [h := hasher hashStream: aStringOrStream].

	sig := self stringToSignature: signatureString.

	^ self verifySignature: sig ofMessageHash: h! !

