

!CryptoPKCS12Test methodsFor: 'testing' stamp: 'RobertWithers 10/12/2015 22:26'!

test9



	| key |

	key := (Pkcs12KeyDerivationFunction new

		derivedKeyWithId: 1

		fromPassword: 'queeg' 

		salt: #(5 222 201 89 172 255 114 247)

		iterations: 1000

		size: 24) hex.

	self assert: key = 'ed2034e36328830ff09df1e1a07dd357185dac0d4f9eb3d4'

! !

