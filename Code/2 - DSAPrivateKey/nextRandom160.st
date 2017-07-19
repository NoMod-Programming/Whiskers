

!DSAPrivateKey methodsFor: 'private' stamp: 'len 11/15/2002 23:18'!

nextRandom160

	^ (RandomPool default next: 20) asInteger! !

