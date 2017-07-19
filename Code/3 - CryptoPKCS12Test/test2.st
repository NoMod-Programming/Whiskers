

!CryptoPKCS12Test methodsFor: 'testing' stamp: 'RobertWithers 10/12/2015 22:20'!

test2



	| key |

	key := (Pkcs12KeyDerivationFunction new

		derivedKeyWithId: 2 

		fromPassword: 'smeg' 

		salt: #(100 43 153 171 68 251 75 31)

		iterations: 1

		size: 8) hex.

	self assert: key = 'c0a38d64a79bea1d'

! !

