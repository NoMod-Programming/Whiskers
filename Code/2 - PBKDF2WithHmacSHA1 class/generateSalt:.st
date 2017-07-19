

!PBKDF2WithHmacSHA1 class methodsFor: 'constants' stamp: 'rww 10/10/2016 03:48'!

generateSalt: saltByteSize



	^ SecureRandom picker nextBytesNonZero: saltByteSize! !

