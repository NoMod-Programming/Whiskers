
!RSAPublicKey methodsFor: 'process' stamp: 'rww 12/13/2006 10:25'!
v15Encrypt: aByteArray

	| em k ps | 
	k := self modulo asByteArray size.
	ps := SecureRandom new nextBytesNonZero: (k - aByteArray size - 3).
	em := 16r00 asByteArray, 16r02 asByteArray, ps, 16r00 asByteArray, aByteArray.
	^ (self crypt: em asInteger) asByteArray.
! !
