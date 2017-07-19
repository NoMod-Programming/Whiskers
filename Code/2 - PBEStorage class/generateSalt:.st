

!PBEStorage class methodsFor: 'defaults' stamp: 'rww 10/22/2016 00:20'!

generateSalt: saltByteSize



	^ SecureRandom picker nextBytesNonZero: saltByteSize! !

