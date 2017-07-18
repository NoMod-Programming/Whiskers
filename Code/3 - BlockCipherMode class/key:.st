
!BlockCipherMode class methodsFor: '*cryptography-tests' stamp: 'rww 10/5/2006 07:00'!
key: aByteArray
	Warning signal: 'you do NOT want to use this method in a real program because we use a hard-coded nonce.  You should take care of your own nonce.'.
	^ (self on: (Rijndael new keySize: aByteArray size; key: aByteArray))
		initialVector: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16) asByteArray! !
