

!CryptoPKCS12Test methodsFor: 'testing' stamp: 'RobertWithers 10/12/2015 22:22'!

test8



	| key |

	key := (Pkcs12KeyDerivationFunction new

		derivedKeyWithId: 1

		fromPassword: 'smeg' 

		salt: #(100 43 153 171 68 251 75 31)

		iterations: 1

		size: 24) hex.

	self assert: key = 'f3a95fec48d7711e985cfe67908c5ab79fa3d7c5caa5d966'

! !

