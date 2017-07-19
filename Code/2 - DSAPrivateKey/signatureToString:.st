

!DSAPrivateKey methodsFor: 'process' stamp: 'rww 9/21/2006 14:16'!

signatureToString: aSignature

	"Answer a string representation of the given signature. This string can be parsed using the stringToSignature: method."



	| s |

	s := WriteStream on: (String new: 2000).

	s nextPutAll: '[DSA digital signature '.

	s nextPutAll: (aSignature first printStringBase: 16).

	s space.

	s nextPutAll: (aSignature second printStringBase: 16).

	s nextPutAll: ']'.

	^ s contents! !

