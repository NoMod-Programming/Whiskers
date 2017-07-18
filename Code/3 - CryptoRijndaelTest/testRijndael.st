
!CryptoRijndaelTest methodsFor: 'block ciphers' stamp: 'RobertWithers 10/12/2015 22:29'!
testRijndael
	| rijndael vector |
	rijndael := Rijndael new keySize: 16; key: (0 to: 15) asByteArray.
	vector := (0 to: 15) asByteArray.
	rijndael encryptBlock: vector.
	self assert: vector hex = '0a940bb5416ef045f1c39458c653ea5a'.
	rijndael decryptBlock: vector.
	self assert: vector hex = '000102030405060708090a0b0c0d0e0f'.

	rijndael := Rijndael new blockSize: 16; keySize: 24.
	rijndael key: (0 to: 16r17) asByteArray.
	vector := (0 to: 15) asByteArray.
	rijndael encryptBlock: vector.
	self assert: vector hex = '0060bffe46834bb8da5cf9a61ff220ae'.
	rijndael decryptBlock: vector.
	self assert: vector hex = '000102030405060708090a0b0c0d0e0f'.

	rijndael := Rijndael new blockSize: 16; keySize: 32.
	rijndael key: (0 to: 16r1F) asByteArray.
	vector := (0 to: 15) asByteArray.
	rijndael encryptBlock: vector.
	self assert: vector hex = '5a6e045708fb7196f02e553d02c3a692'.
	rijndael decryptBlock: vector.
	self assert: vector hex = '000102030405060708090a0b0c0d0e0f'! !
