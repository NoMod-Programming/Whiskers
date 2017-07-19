

!CryptoPBKDF2AndPBEStorageTest methodsFor: 'testing' stamp: 'rww 12/3/2016 12:32'!

testPBEStorage



	| originalBytes encodedBytes decodedBytes |

	originalBytes := 'hello world' asByteArray.

	encodedBytes := (PBEStorage new

		encryptedBytes: originalBytes) asByteArray.

	decodedBytes := (PBEStorage fromByteArray: encodedBytes) encryptedBytes.

	self assert: originalBytes = decodedBytes.

! !

