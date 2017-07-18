
!PBEEncryptor methodsFor: 'encryption' stamp: 'rww 12/18/2016 10:16'!
encrypt: byteArray

	| pbe iv downCipher |
	key ifNil: [ | pbkdf |
		pbkdf := PBKDF2WithHmacSHA1 new. 
		key := pbkdf deriveKeyFromPassword: password.
		pbeTemplate := PBEStorage new
			salt: pbkdf salt;
			iterations: pbkdf iterations;
			keyBitSize: pbkdf keyBitSize;
			yourself].
	downCipher := (Rijndael key: key) cbc.
	iv := self generateIv.
	pbe := PBEStorage new
		salt: pbeTemplate salt;
		iterations: pbeTemplate iterations;
		keyBitSize: pbeTemplate keyBitSize;
		iv: iv clone;
		encryptedBytes: (downCipher initialVector: iv clone; encrypt: byteArray);
		yourself.
	^ pbe asByteArray.
 
! !
