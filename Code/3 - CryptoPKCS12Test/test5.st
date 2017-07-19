

!CryptoPKCS12Test methodsFor: 'testing' stamp: 'RobertWithers 10/12/2015 22:21'!

test5



	| key |

	key := (Pkcs12KeyDerivationFunction new

		derivedKeyWithId: 3 

		fromPassword: 'smeg' 

		salt: #(61 131 192 228 84 106 193 64)

		iterations: 1

		size: 20) hex.

	self assert: key = '8d967d88f6caa9d714800ab3d48051d63f73a312'

! !

