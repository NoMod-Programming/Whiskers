
!RSAPublicKey methodsFor: 'process' stamp: 'rww 4/28/2007 14:25'!
v15VerifySignature: aSignature ofMessageHash: encodedMsg
	"Answer true if the given signature string signs the given message (a stream or string)."
	"Note: Random numbers are not needed for signature verification; thus, there is no need to call initRandomFromUser before verifying a signature."

	| bytes signedMsg |
	bytes := (self crypt: aSignature asInteger) asByteArray.
	signedMsg := bytes readStream upTo: 1; upTo: 0; upToEnd.
	^ encodedMsg = signedMsg
! !
