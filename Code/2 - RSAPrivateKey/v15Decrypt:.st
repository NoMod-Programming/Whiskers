
!RSAPrivateKey methodsFor: 'process' stamp: 'rww 9/26/2006 16:29'!
v15Decrypt: aByteArray

	| em stream |
	em := self crypt: aByteArray asInteger.
	stream := em asByteArray readStream.
	stream upTo: 16r02.
	stream upTo: 16r00.
	^ stream upToEnd.
! !
