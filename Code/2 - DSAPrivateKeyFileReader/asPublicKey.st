

!DSAPrivateKeyFileReader methodsFor: 'converting' stamp: 'rww 9/27/2006 21:31'!

asPublicKey



	| asn1 |

	asn1 := self asASN1Value.

	^ DSAPublicKey p: (asn1 at: 2) q: (asn1 at: 3) g: (asn1 at: 4) y: (asn1 at: 5).

! !

