
!CryptoPBKDF2AndPBEStorageTest methodsFor: 'testing' stamp: 'rww 10/16/2016 20:25'!
testPBKDF2

	| kdf1 kdf2 result1 result2 |
	kdf1 := PBKDF2WithHmacSHA1 new.
	result1 := kdf1 deriveKeyFromPassword: 'password'. 
	kdf2 := PBKDF2WithHmacSHA1 newForSalt: kdf1 salt iterations: kdf1 iterations keyBitSize: kdf1 keyBitSize.
	result2 := kdf2 deriveKeyFromPassword: 'password'.
	self assert: result1 = result2! !
