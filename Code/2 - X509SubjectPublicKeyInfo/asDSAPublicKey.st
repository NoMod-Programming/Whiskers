

!X509SubjectPublicKeyInfo methodsFor: 'private' stamp: 'rww 3/27/2007 21:08'!

asDSAPublicKey



	| params y |

	params := self algorithm parameters.

	y := self subjectPublicKeyDecoded.

	^ DSAPublicKey p: (params at: 1) q: (params at: 2) g: (params at: 3) y: y.

! !

