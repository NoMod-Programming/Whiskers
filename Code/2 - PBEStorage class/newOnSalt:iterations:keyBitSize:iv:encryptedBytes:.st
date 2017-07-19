

!PBEStorage class methodsFor: 'instance creation' stamp: 'rww 10/22/2016 04:45'!

newOnSalt: salt iterations: iterations keyBitSize: keyBitSize iv: iv encryptedBytes: encryptedBytes



	^ super new

		initializeOnSalt: salt

		iterations: iterations 

		keyBitSize: keyBitSize

		iv: iv

		encryptedBytes: encryptedBytes;

			yourself.! !

