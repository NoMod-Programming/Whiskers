

!PBKDF2WithHmacSHA1 class methodsFor: 'instance creation' stamp: 'rww 10/14/2016 03:51'!

newForSalt: salt iterations: iterations keyBitSize: keyBitSize



	((keyBitSize \\ 8) > 0)

		ifTrue: [self error: 'key length not on byte boundary'].

	^super new

		salt: salt;

		iterations: iterations;

		keyBitSize: keyBitSize! !

