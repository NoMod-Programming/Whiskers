
!CryptoRC2Test methodsFor: 'testing' stamp: 'RJT 4/6/2007 16:01'!
genericARC2TestKey: key effectiveKeyLength: aLength plaintext: plainText ciphertext: ciphertext
	| vector rc2 |
	vector := plainText copy.
	rc2 := ARC2 key: key effectiveKeyLength: aLength.
	rc2 encryptBlock: vector.
	self assert: vector = ciphertext.
	
	rc2 decryptBlock: vector.
	self assert: vector = plainText.
	rc2 destroy.! !
