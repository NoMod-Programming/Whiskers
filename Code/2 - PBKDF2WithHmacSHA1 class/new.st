
!PBKDF2WithHmacSHA1 class methodsFor: 'instance creation' stamp: 'rww 10/14/2016 03:44'!
new

	^ self newForSalt: self generateDefaultSalt iterations: self defaultIterations keyBitSize: self defaultKeyBitSize! !
