
!RSAEncryptionScheme methodsFor: 'encryption scheme' stamp: 'rww 4/11/2004 14:50'!
encrypt: aByteArray
	| k em c |
	k := publicKey bits // 8.
	em := self encode: aByteArray parameter: encodingParameter length: k-1.
	c := publicKey crypt: em asInteger.
	^ c asByteArray! !
