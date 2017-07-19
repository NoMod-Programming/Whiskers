

!CryptoPKCS12Test methodsFor: 'testing' stamp: 'RobertWithers 10/12/2015 22:24'!

test10



	| key |

	key := (Pkcs12KeyDerivationFunction new

		derivedKeyWithId: 1

		fromPassword: 'queeg' 

		salt: #(22 130 192 252 91 63 126 197)

		iterations: 1000

		size: 24) hex.

	self assert: key = '483dd6e919d7de2e8e648ba8f862f3fbfbdc2bcb2c02957f'

! !

