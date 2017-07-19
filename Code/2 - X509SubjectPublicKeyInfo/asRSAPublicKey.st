

!X509SubjectPublicKeyInfo methodsFor: 'private' stamp: 'rww 9/28/2010 07:00'!

asRSAPublicKey



	| keys |

	keys := self subjectPublicKeyDecoded.

	^ (RSAPublicKey exponent: (keys at: 2) asInteger modulo: (keys at: 1) asInteger).

! !

