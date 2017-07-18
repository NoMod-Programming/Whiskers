
!CryptoRijndaelTest methodsFor: 'as yet unclassified' stamp: 'cmm 1/3/2007 21:45'!
runEncryptDecrypt: blockCipherClass
	| msg key1 key2 enc1 enc2 dec1 dec2 ct2 ct1 |
	enc1 := blockCipherClass key: (key1 := SecureRandom picker nextBytes: 16).
	dec1 := blockCipherClass key: key1.
	enc2 := blockCipherClass key: (key2 := SecureRandom picker nextBytes: 16).
	dec2 := blockCipherClass key: key2.
	msg := 'hello how are you?' asByteArray.
	ct2 := enc2 encrypt: msg.
	self deny: msg = ct2.
	self assert: (dec2 decrypt: ct2) = msg.
	"ensure the cipher still works if its key is changed after creation, both for the encryptor instance and decryptor instance."
	enc1 key: key2.  dec1 key: key2.
	ct1 := enc1 encrypt: msg.
	self assert: (dec1 decrypt: ct1) = msg! !
