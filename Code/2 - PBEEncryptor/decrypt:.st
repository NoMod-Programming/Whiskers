

!PBEEncryptor methodsFor: 'encryption' stamp: 'rww 12/18/2016 11:33'!

decrypt: byteArray



	| pbe upCipher |

	pbe := PBEStorage fromByteArray: byteArray.

	key ifNil: [ | pbkdf |

		pbkdf := PBKDF2WithHmacSHA1 on: pbe.

		key := pbkdf deriveKeyFromPassword: password.

		pbeTemplate := PBEStorage new

			salt: pbkdf salt;

			iterations: pbkdf iterations;

			keyBitSize: pbkdf keyBitSize;

			yourself].

	upCipher := (Rijndael key: key) cbc..

	^ upCipher

		initialVector: pbe iv clone;

		decrypt: pbe encryptedBytes. 

! !

