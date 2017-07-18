
!CryptoPBKDF2AndPBEStorageTest methodsFor: 'testing' stamp: 'rww 12/14/2016 08:17'!
testPBEEncryptor

	| password originalBytes encryptedBytes decryptedBytes encryptor |
	password := 'password' asByteArray.
	originalBytes := 'hello world' asByteArray.
	encryptor := PBEEncryptor newPassword: password.
	encryptedBytes := encryptor encrypt: originalBytes.
	decryptedBytes := encryptor decrypt: encryptedBytes.
	self assert: originalBytes = decryptedBytes.
! !
