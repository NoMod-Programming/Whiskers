

!PBEStorage class methodsFor: 'instance creation' stamp: 'rww 12/3/2016 12:31'!

new



	^ self newOnSalt: self defaultSalt 

		iterations: self defaultIterations 

		keyBitSize: self defaultKeyBitSize

		iv: #[]

		encryptedBytes: nil.! !

