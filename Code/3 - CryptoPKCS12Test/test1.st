
!CryptoPKCS12Test methodsFor: 'testing' stamp: 'RobertWithers 10/12/2015 22:17'!
test1

	| key |
	key := (Pkcs12KeyDerivationFunction new
		derivedKeyWithId: 2 
		fromPassword: 'smeg' 
		salt: #(10 88 207 100 83 13 130 63)
		iterations: 1
		size: 8) hex.
	self assert: key = '79993dfe048d3b76'
! !
