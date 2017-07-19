

!PBEEncryptor methodsFor: 'private' stamp: 'rww 12/2/2016 02:57'!

generateIv



	^ SecureRandom picker nextBytes: Rijndael blockSize.! !

