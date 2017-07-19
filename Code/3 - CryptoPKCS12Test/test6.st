

!CryptoPKCS12Test methodsFor: 'testing' stamp: 'RobertWithers 10/12/2015 22:21'!

test6



	| key |

	key := (Pkcs12KeyDerivationFunction new

		derivedKeyWithId: 3 

		fromPassword: 'queeg' 

		salt: #(38 50 22 252 194 250 179 28)

		iterations: 1000

		size: 20) hex.

	self assert: key = '5ec4c7a80df652294c3925b6489a7ab857c83476'

! !

