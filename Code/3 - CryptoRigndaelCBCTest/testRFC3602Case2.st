
!CryptoRigndaelCBCTest methodsFor: 'tests' stamp: 'RobertWithers 10/12/2015 22:35'!
testRFC3602Case2
	"this test comes from RFC3602 http://www.faqs.org/rfcs/rfc3602.html
	Case #2: Encrypting 32 bytes (2 blocks) using AES-CBC with 128-bit key
	Key       : 0xc286696d887c9aa0611bbb3e2025a45a
	IV        : 0x562e17996d093d28ddb3ba695a2e6f58
	Plaintext : 0x000102030405060708090a0b0c0d0e0f
              101112131415161718191a1b1c1d1e1f
	Ciphertext: 0xd296cd94c2cccf8a3a863028b5e1dc0a
              7586602d253cfff91b8266bea6d61ab1"

	| result |
	result := ((CBC on: (Rijndael new keySize: 16;
			 key: (ByteArray fromHexString: '16rc286696d887c9aa0611bbb3e2025a45a')))
		initialVector: (ByteArray fromHexString: '16r562e17996d093d28ddb3ba695a2e6f58'))
		encrypt: (result := ByteArray fromHexString: '16r000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f').
	self assert: result hex = 'd296cd94c2cccf8a3a863028b5e1dc0a7586602d253cfff91b8266bea6d61ab1bcfd81022202366bde6dd260a15841a1'! !
