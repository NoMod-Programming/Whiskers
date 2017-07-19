

!CryptoPKCS12Test methodsFor: 'testing' stamp: 'RobertWithers 10/12/2015 22:22'!

test7



	| key |

	key := (Pkcs12KeyDerivationFunction new

		derivedKeyWithId: 1

		fromPassword: 'smeg' 

		salt: #(10 88 207 100 83 13 130 63)

		iterations: 1

		size: 24) hex.

	self assert: key = '8aaae6297b6cb04642ab5b077851284eb7128f1a2a7fbca3'

! !

